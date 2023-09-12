class MansionRoomRegistrationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :layout, :string
  attribute :thanksMoney, :integer
  attribute :securityDeposit, :integer
  attribute :floorNumber, :integer
  attribute :mansion_id, :integer
  attribute :stayFee, :integer
  attribute :rent, :integer
  attribute :maintenanceFee, :integer
  attribute :contractDuration, :string
  attribute :mansion_room_photos, array: true


  validates :name, presence: true
  validates :layout, presence: true
  validates :thanksMoney, presence: true
  validates :securityDeposit, presence: true
  validates :floorNumber, presence: true
  validates :stayFee, presence: true
  validates :rent, presence: true
  validates :maintenanceFee, presence: true
  validates :contractDuration, presence: true
  validates :mansion_id, presence: true
  validates :mansion_room_photos, presence: true

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
        mansion_id: mansion_id,
        stayFee: stayFee,
        rent: rent,
        maintenanceFee: maintenanceFee,
        contractDuration: contractDuration
      )

      @saved_mansion_room = mansion_room

      mansion_room_photos.each do |photo|
        MansionRoomPhoto.create!(image: photo, mansion_room_id: mansion_room.id)
     end
    end
  end
end
