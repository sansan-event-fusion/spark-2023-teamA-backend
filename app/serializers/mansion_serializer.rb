class MansionSerializer < ActiveModel::Serializer
  belongs_to :rental_house
  attributes :id
  attributes :rental_house_id
end