class CartItem < ApplicationRecord

	belongs_to :user
	belongs_to :item

	def items_price
		item.price * sheet
	end

	def  sub_total
		item.price.to_i * sheet.to_i
	end

	def  total_price
		
	end



end
