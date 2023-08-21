class FacultySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_one :image

end
