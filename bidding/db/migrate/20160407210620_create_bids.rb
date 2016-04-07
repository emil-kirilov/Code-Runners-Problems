class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.decimal :amount, :precision =>8, :scale =>2, null: false
      t.references :user, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
