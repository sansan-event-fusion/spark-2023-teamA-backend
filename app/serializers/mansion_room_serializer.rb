class MansionRoomSerializer < ActiveModel::Serializer
  belongs_to :mansion

  attributes :id
  attributes :name
  attributes :layout
  attributes :thanks_money
  attributes :security_deposit
  attributes :floor_number
  attributes :mansion_id
  attributes :stay_fee
  attributes :rent
  attributes :maintenance_fee
  attributes :contract_duration
end
