class CartItem < ApplicationRecord

	belongs_to :user
	belongs_to :item

	def items_price
		item.price * sheet
	end




end
