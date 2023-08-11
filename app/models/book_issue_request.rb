class BookIssueRequest < ApplicationRecord
  belongs_to :student
  belongs_to :faculty
  belongs_to :book
  
  validates :status, presence: true

  after_save :saved_request

  def saved_request
   puts " hello"
  end
end
