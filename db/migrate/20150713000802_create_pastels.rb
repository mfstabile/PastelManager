class CreatePastels < ActiveRecord::Migration
  def change
    create_table :pastels do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
