class CreateOrderitems < ActiveRecord::Migration[5.1]
  def change
    create_table :orderitems do |t|
      t.integer :bike_id
      t.string :title
      t.text :description
      t.integer :qantity
      t.decimal :price
      t.string :duration
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
