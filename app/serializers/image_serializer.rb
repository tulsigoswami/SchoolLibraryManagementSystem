class ImageSerializer < ActiveModel::Serializer
  attributes :url

  belongs_to:faculty
  belongs_to:student
  belongs_to:book
end
