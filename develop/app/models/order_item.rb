class OrderItem < ApplicationRecord

	has_many :items, dependent: :destroy
	belongs_to :order

end
