 class Order < ApplicationRecord

	has_many :order_items, dependent: :destroy
	belongs_to :user
	accepts_nested_attributes_for :order_items, allow_destroy: true

	enum payment_method: {
		銀行振込: 0,
		代金引換: 1,
		クレジットカード決済: 2
	}

	enum delivery_status: {
		受付: 0,
		商品準備中: 1,
		出荷済: 2
	}



  def name
    family_name + first_name
  end
end
