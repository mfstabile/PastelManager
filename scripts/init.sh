#! /bin/bash
#
# Builds the Docker image using Docker-Compose,
# Wraps running bundler and rspec tests,
# Starts and Restarts the app;
# (requires docker, docker-compose and sudo privileges)
#

DOCKER='docker'
DOCKER_COMPOSE='docker-compose'
GEMS='Gemfile'

function usage {
    echo "usage: ./scripts/init.sh [OPTIONS]:"
    echo " "
    echo " all:        Builds everything, images and containers."
    echo " run:        Runs the app on the latest container."
    echo " test:       Runs all tests."
    echo " clean:      Stops and Removes all containers."
    echo " purge:      Stops and Removes all containers and images."
    echo " update:     Runs bundle update."
    echo " migrate:    Runs all migrations. (also done by 'run' and 'all')"
    echo " restart:    Stops all containers and then 'run'."
    echo " seed:       Puts initial values on the database."
    echo " help:       Prints this message."
    echo " "
}
function check_deps {
    # Check dependencies.
    command -v ${DOCKER}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER}', but it's not installed.  Aborting."; exit 1; }
    command -v ${DOCKER_COMPOSE}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER_COMPOSE}', but it's not installed.  Aborting."; exit 1; }
    return 0
}
function app_seed {
    ${DOCKER_COMPOSE} run web rake db:seed       # Seeds the database.
}
function build_clean {
    docker stop $(docker ps -a -q)    # Stops old containers.
    docker rm $(docker ps -a -q)      # Remove old containers.
    rm ./tmp/pid/server.pid
}
function app_restart {
    docker stop $(sdocker ps -a -q)    # Stops old containers.
    docker-compose up                      # Starts the app.
}
function app_migrate {
    docker-compose run web rake db:create  # Creates all databases.
    docker-compose run web rake db:migrate # Runs migrations.
}
function app_test {
    app_migrate
    docker-compose run web rake db:create  # Creates all databases.
    docker-compose run web rake spec       # Runs tests.
}
function app_run {
    app_migrate
    docker-compose run web rake db:seed    # Adds admin user.
    docker-compose up                      # Starts the app.
}
function build_update {
    docker-compose run web bundle update   # Updating gems.
    app_test
}
function build_all {
    PROJECT_DIR=${PWD##*/}                      # Gets current dir name.
    build_clean
    rm ${GEMS}.lock                             # Purges the lock.
    docker rmi ${PROJECT_DIR}_web:latest   # Removes old project image.
    docker-compose build                   # Builds a new image.
    app_test
}
if check_deps; then
    if [[ $1 == all ]]; then build_all;
    elif [[ $1 == update ]]; then build_update;
    elif [[ $1 == clean ]]; then build_clean;
    elif [[ $1 == restart ]]; then app_restart;
    elif [[ $1 == run ]]; then app_run;
    elif [[ $1 == migrate ]]; then app_migrate;
    elif [[ $1 == test ]]; then app_test;
    elif [[ $1 == seed ]]; then app_seed;
    elif [[ $1 == help ]]; then usage;
    else { echo "No valid arguments, exiting."; exit 0; }
    fi
fi
