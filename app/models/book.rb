class Book < ApplicationRecord
  validates :name, presence: true
  validates :quantity, presence: true
  belongs_to :faculty
  belongs_to :category, optional: true
  has_one :image, as: :imageable, dependent: :destroy
end





