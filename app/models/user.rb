class User < ApplicationRecord
  self.inheritance_column = :type

  has_one_attached :picture
  has_secure_password

  validates :name, presence: true
  validates :email,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},presence: true, uniqueness: true
  validates :type, presence: true
end
