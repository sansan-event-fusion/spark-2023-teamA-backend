class MansionSerializer < ActiveModel::Serializer
  belongs_to :rental_house
  has_many :mansion_rooms

  attributes :id
  attributes :rental_house_id
end
