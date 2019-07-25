class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

	has_many :cart_items, dependent: :destroy
	has_many :orders, dependent: :destroy
	has_many :addresses, dependent: :destroy
	accepts_nested_attributes_for :addresses

	enum is_deleted:{
		会員: 0,
		退会済み: 1
	}
	def self.search(search) #self.でクラスメソッドとしている
     if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
       User.where(['family_name LIKE ? OR first_name LIKE ?', "%#{search}%"])
     else
       User.all #全て表示。
     end
    end

	def total_price
		cart_items = CartItem.where(user_id: id)
		cart_items.to_a.sum{|cart_item|cart_item.items_price}
	end


end
