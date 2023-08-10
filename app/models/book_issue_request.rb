class BookIssueRequest < ApplicationRecord
  belongs_to :student
  belongs_to :faculty
  belongs_to :book
  
  validates :status, presence: true
end
