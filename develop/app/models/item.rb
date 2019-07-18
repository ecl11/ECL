class Item < ApplicationRecord

	acts_as_paranoid

	has_many :discs, :dependent => :destroy
	accepts_nested_attributes_for :discs, allow_destroy: true

	belongs_to :order_item, optional: true
	belongs_to :artist, optional: true
	belongs_to :label, optional: true
	belongs_to :genre, optional: true



	enum sales_status:{
		販売中: 0,
		販売停止中: 1
	}
	attachment :jacket_image

end
