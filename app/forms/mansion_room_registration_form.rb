class MansionRoomRegistrationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :layout, :string
  attribute :thanksMoney, :integer
  attribute :securityDeposit, :integer
  attribute :floorNumber, :integer
  #attribute :availableDates, :array
  attribute :mansion_id, :integer
  #attribute :room_status_id, :integer
  attribute :stayFee, :integer
  attribute :rent, :integer
  attribute :maintenanceFee, :integer
  attribute :contractDuration, :string

  attr_reader :saved_mansion_room

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      mansion_room = MansionRoom.create!(
        name: name,
        layout: layout,
        thanksMoney: thanksMoney,
        securityDeposit: securityDeposit,
        floorNumber: floorNumber,
        #availableDates: availableDates,
        mansion_id: mansion_id,
        #room_status_id: room_status_id,
        stayFee: stayFee,
        rent: rent,
        maintenanceFee: maintenanceFee,
        contractDuration: contractDuration
      )

      # ここで追加の処理を追加できます

      @saved_mansion_room = mansion_room
    end
  end
end
