class Disc < ApplicationRecord

	has_many :songs, :dependent => :destroy
	belongs_to :item
  accepts_nested_attributes_for :songs, allow_destroy: true
end
