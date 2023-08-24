class BookIssueRequest < ApplicationRecord
  belongs_to :student
  belongs_to :faculty
  belongs_to :book
  
  validates :status,:student_id,:book_id,presence: true
end
