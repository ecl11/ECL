class Item < ApplicationRecord

	acts_as_paranoid

	has_many :discs, :dependent => :destroy
	accepts_nested_attributes_for :discs, allow_destroy: true

	belongs_to :order_item, optional: true
	belongs_to :artist, optional: true
	belongs_to :label, optional: true
	belongs_to :genre, optional: true

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
