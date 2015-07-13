class CreateClimas < ActiveRecord::Migration
  def change
    create_table :climas do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
