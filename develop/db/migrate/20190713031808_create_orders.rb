class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :payment_method
      t.integer :delivery_status
      t.text :address
      t.string :post_number
      t.string :family_name
      t.string :first_name
      t.string :phone_number
      t.integer :total_price
      t.integer :shipping_fee
      t.integer :amount

      t.timestamps
    end
  end
end
