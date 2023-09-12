class RentalHouseSerializer < ActiveModel::Serializer
  # belongs_to :owner
  belongs_to :structure_type
  has_many :rental_house_photos
  has_one :mansion

  attributes :id
  attributes :name
  attributes :address
  attributes :nearest_station
  attributes :max_floor_number
  attributes :building_age
  attributes :structure_type_id
end
