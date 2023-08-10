class Image < ApplicationRecord
	validates :url, presence: true
	belongs_to :imageable, polymorphic: true
end
