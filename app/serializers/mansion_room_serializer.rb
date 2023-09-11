class MansionRoomSerializer < ActiveModel::Serializer
  belongs_to :mansion
  # has_many :mansion_photos

  attributes :id
  attributes :name
  attributes :layout
  attributes :thanksMoney
  attributes :securityDeposit
  attributes :floorNumber
  attributes :availableDates
  attributes :mansion_id
  attributes :room_status_id
  attributes :stayFee
  attributes :rent
  attributes :maintenanceFee
  attributes :contractDuration
end
