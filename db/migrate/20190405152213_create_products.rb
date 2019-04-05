class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.text :notes
      t.references :supplier, foreign_key: true

      t.timestamps
    end
  end
end
