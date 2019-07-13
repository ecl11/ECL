class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :artist_id
      t.integer :label_id
      t.integer :genre_id
      t.string :product_name
      t.integer :price
      t.string :jacket_image_id
      t.integer :stock_quantity
      t.integer :sales_status
      t.integer :deleted_at

      t.timestamps
    end
  end
end
