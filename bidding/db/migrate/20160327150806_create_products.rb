class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :photo, null: false
      t.integer :price, null: false

      t.timestamps null: false
    end
  end
end
