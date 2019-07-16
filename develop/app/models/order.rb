class Order < ApplicationRecord

	has_many :order_items, dependent: :destroy
	belongs_to :user

	enum payment_method: {
		bank_transfer: 0,
		cod: 1,
		credit_card_payment: 2
	}

	enum delivery_status: {
		受付: 0,
		商品準備中: 1,
		出荷済: 2
	}

end
