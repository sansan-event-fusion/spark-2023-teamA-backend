class RentalHouse < ApplicationRecord
    belongs_to :owner
    belongs_to :structure_type

    validates :name, presence: true
    validates :address, presence: true
    validates :structure_type_id, presence: true
    validates :maxFloorNumber, presence: true
    validates :buildingAge, presence: true
    validates :owner_id, presence: true
end