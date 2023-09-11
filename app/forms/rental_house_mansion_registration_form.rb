class RentalHouseMansionRegistrationForm
    include ActiveModel::Model
    include ActiveModel::Attributes
  
    attribute :name, :string
    attribute :address, :string
    attribute :structure_type_id, :integer
    attribute :maxFloorNumber, :integer
    attribute :buildingAge, :integer
    attribute :owner_id, :integer
    attribute :rental_house_photos, array: true
  
    validates :name, presence: true
    validates :address, presence: true
    validates :structure_type_id, presence: true
    validates :maxFloorNumber, presence: true
    validates :buildingAge, presence: true
    validates :owner_id, presence: true
    validates :rental_house_photos, presence: true

    attr_reader :saved_mansion
    
    def save
      return false unless valid?
    
      ActiveRecord::Base.transaction do
        rental_house = RentalHouse.create!(
          name: name,
          address: address,
          structure_type_id: structure_type_id,
          maxFloorNumber: maxFloorNumber,
          buildingAge: buildingAge,
          owner_id: owner_id
        )
       @saved_mansion = Mansion.create!(rental_house_id: rental_house.id)

       rental_house_photos.each do |photo|
          RentalHousePhoto.create!(image: photo, rental_house_id: rental_house.id)
       end
      end
    end
  end
  