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
  attribute :contract_duration, :string

  attr_reader :saved_mansion_room

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      mansion_room = MansionRoom.create!(
        name: name,
        layout: layout,
        thanks_money: thanks_money,
        security_deposit: security_deposit,
        floor_number: floor_number,
        mansion_id: mansion_id,
        stay_fee: stay_fee,
        rent: rent,
        maintenance_fee: maintenance_fee,
        contract_duration: contract_duration
      )

      @saved_mansion_room = mansion_room
    end
  end
end
