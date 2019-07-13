class Item < ApplicationRecord

	has_many :cart_items, dependent: :destroy
	has_many :discs, dependent: :destroy
	belongs_to :order_item
	belongs_to :artist
	belongs_to :label
	belongs_to :genre

end
