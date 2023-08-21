class StudentSerializer < ActiveModel::Serializer
  attributes :id

  has_many :book_issue_requests
  has_one :image
end
