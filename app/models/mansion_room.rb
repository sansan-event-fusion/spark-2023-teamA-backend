class MansionRoom < ApplicationRecord
  belongs_to :mansion


  has_many :mansion_room_photos
  
  validates :mansion_id, presence: true
end
