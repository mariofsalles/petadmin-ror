class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :notes
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
