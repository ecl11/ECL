class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :family_name
      t.string :first_name
      t.string :kana_family_name
      t.string :kana_first_name
      t.integer :post_number
      t.text :address
      t.string :phone_number

      t.timestamps
    end
  end
end
