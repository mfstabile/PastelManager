class CreateQualidades < ActiveRecord::Migration
  def change
    create_table :qualidades do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
