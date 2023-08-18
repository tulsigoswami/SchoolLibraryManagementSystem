class User < ApplicationRecord
  self.inheritance_column = :type

  validates :name, presence: true
  validates :email,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},presence: true, uniqueness: true
  validates :type, presence: true
end
