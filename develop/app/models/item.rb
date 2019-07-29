class Item < ApplicationRecord

	acts_as_paranoid

	has_many :discs, :dependent => :destroy
	has_many :order_items, :dependent => :destroy
  accepts_nested_attributes_for :discs, allow_destroy: true

	belongs_to :artist, optional: true
	belongs_to :label, optional: true
	belongs_to :genre, optional: true


    validate :add_error_sample

    def add_error_sample
    # nameが空のときにエラーメッセージを追加する
    if product_name.blank?
      errors[:base] << "商品名を入力してください"
    end

    # 価格が空のときにエラーメッセージを追加する
    if price.blank?
      errors[:base] << "価格を入力してください"
    end

    if stock_quantity.blank?
      errors[:base] << "在庫数を入力してください"
    end

  end
  def price_with_tax
    (price.to_i * 1.08).round
  end

	def self.search(search) #self.でクラスメソッドとしている
    	if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      		Item.where(['product_name LIKE ?', "%#{search}%"])
    	else
    		Item.all #全て表示。
    	end
	end



	enum sales_status:{
		販売中: 0,
		販売停止中: 1
	}
	attachment :jacket_image
end
