class CreatePastelQuantidades < ActiveRecord::Migration
  def change
    create_table :pastel_quantidades do |t|
      t.references :pastel, index: true, foreign_key: true
      t.integer :quantidade

      t.timestamps null: false
    end
  end
end
