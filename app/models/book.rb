class Book < ApplicationRecord
  validates :name, presence: true
  validates :quantity, presence: true
  belongs_to :faculty
  belongs_to :category
  has_one :image, as: :imageable, dependent: :destroy

 scope :created_in, -> {
  where(created_at: Date.today)
 }

end




