class RentalHouseSerializer < ActiveModel::Serializer
  belongs_to :owner
  belongs_to :structure_type

  attributes :id, 
  attributes :name, 
  attributes :address,
  attributes :maxFloorNumber,
  attributes :buildingAge,
  attributes :owner,
  attributes :structure_type
end