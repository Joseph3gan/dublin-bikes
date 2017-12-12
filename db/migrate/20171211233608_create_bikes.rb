class CreateBikes < ActiveRecord::Migration[5.1]
  def change
    create_table :bikes do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url
      t.string :duration

      t.timestamps
    end
  end
end
