class MansionRoomRegistrationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :layout, :string
  attribute :thanks_money, :integer
  attribute :security_deposit, :integer
  attribute :floor_number, :integer
  attribute :mansion_id, :integer
  attribute :stay_fee, :integer
  attribute :rent, :integer

  attribute :maintenance_fee, :integer
  attribute :reserve_url, :string
  attribute :contract_duration, :string
  attribute :mansion_room_photos, array: true

  validates :name, presence: true
  validates :layout, presence: true
  validates :thanks_money, presence: true
  validates :security_deposit, presence: true
  validates :floor_number, presence: true
  validates :mansion_id, presence: true
  validates :stay_fee, presence: true
  validates :rent, presence: true
  validates :maintenance_fee, presence: true
  validates :reserve_url, presence: true
  validates :contract_duration, presence: true

  attr_reader :saved_mansion_room

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      mansion_room = MansionRoom.create!(
        name:,
        layout:,
        thanks_money:,
        security_deposit:,
        floor_number:,
        mansion_id:,
        stay_fee:,
        rent:,
        maintenance_fee:,
        reserve_url:,
        contract_duration:
      )

      @saved_mansion_room = mansion_room

      mansion_room_photos.each do |photo|
        MansionRoomPhoto.create!(image: photo, mansion_room_id: mansion_room.id)
      end
    end
  end
end
