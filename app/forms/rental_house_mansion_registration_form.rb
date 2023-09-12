class RentalHouseMansionRegistrationForm
    include ActiveModel::Model
    include ActiveModel::Attributes
  
    attribute :name, :string
    attribute :address, :string
    attribute :nearest_station, :string
    attribute :structure_type_id, :integer
    attribute :max_floor_number, :integer
    attribute :building_age, :integer
    attribute :owner_id, :integer
    attribute :rental_house_photos, array: true
  
    #Todo : Validateを記述する
    validates :name, presence: true
    validates :address, presence: true
    validates :nearest_station, presence: true
    validates :structure_type_id, presence: true
    validates :max_floor_number, presence: true
    validates :building_age, presence: true
    validates :owner_id, presence: true
    validates :rental_house_photos, presence: true

    attr_reader :saved_mansion
    
    def save
      return false unless valid?
    
      ActiveRecord::Base.transaction do
        rental_house = RentalHouse.create!(
          name: name,
          address: address,
          nearest_station: nearest_station,
          structure_type_id: structure_type_id,
          max_floor_number: max_floor_number,
          building_age: building_age,
          owner_id: owner_id
        )
       @saved_mansion = Mansion.create!(rental_house_id: rental_house.id)

       rental_house_photos.each do |photo|
          RentalHousePhoto.create!(image: photo, rental_house_id: rental_house.id)
       end
      end
    end
  end
  