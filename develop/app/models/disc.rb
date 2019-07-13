class Disc < ApplicationRecord

	has_many :discs, dependent: :destroy
	belongs_to :item

end
