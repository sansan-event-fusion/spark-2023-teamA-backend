class Mansion < ApplicationRecord
    belongs_to :rental_house
    has_many :mansion_rooms, dependent: :destroy
    # createだけ
    validates :rental_house_id, presence: true
end