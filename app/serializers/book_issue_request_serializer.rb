class BookIssueRequestSerializer < ActiveModel::Serializer
  attributes :id, :status, :book_id

  belongs_to :student
end
