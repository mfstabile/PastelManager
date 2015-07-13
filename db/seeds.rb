# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
carne = Pastel.create!(:nome => "Carne")
carnech = Pastel.create!(:nome => "Carne com Cheddar")
carneqj = Pastel.create!(:nome => "Carne com Queijo")
carneov = Pastel.create!(:nome => "Carne com Ovo")
queijo = Pastel.create!(:nome => "Queijo")
pizza = Pastel.create!(:nome => "Pizza")
escarola = Pastel.create!(:nome => "Escarola")
francocat = Pastel.create!(:nome => "Frango com Catupiry")

PastelQuantidade.create!(:pastel => carne, :quantidade => 10)
# PastelQuantidade.create!(:pastel => carnech, :quantidade => 10)
# PastelQuantidade.create!(:pastel => carneqj, :quantidade => 10)
# PastelQuantidade.create!(:pastel => carneov, :quantidade => 10)
# PastelQuantidade.create!(:pastel => queijo, :quantidade => 10)
# PastelQuantidade.create!(:pastel => pizza, :quantidade => 10)
# PastelQuantidade.create!(:pastel => escarola, :quantidade => 10)
# PastelQuantidade.create!(:pastel => frangocat, :quantidade => 10)

Qualidade.create!(:descricao => "Bom")
Qualidade.create!(:descricao => "Normal")
Qualidade.create!(:descricao => "Ruim")

Clima.create!(:descricao => "Calor")
Clima.create!(:descricao => "Frio")
Clima.create!(:descricao => "Calor e Chuva")
Clima.create!(:descricao => "Frio e Chuva")
