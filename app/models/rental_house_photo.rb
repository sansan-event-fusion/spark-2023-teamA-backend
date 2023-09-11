class RentalHousePhoto < ApplicationRecord
    belongs_to :rental_house
    validates :rental_house_id, presence: true
    validates :image, presence: true
end