class OrderItem < ApplicationRecord

	has_many :items, dependent: :destroy
	belongs_to :order
	accepts_nested_attributes_for :orders, allow_destroy: true

end
