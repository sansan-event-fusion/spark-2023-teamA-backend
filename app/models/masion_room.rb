class MansionRoom < ApplicationRecord
  belongs_to :mansion
  has_many :mansion_photos, dependent: :destroy

  # バリデーションの設定
  validates :name, presence: true
  validates :layout, presence: true
  validates :thanksMoney, presence: true
  validates :securityDeposit, presence: true
  validates :floorNumber, presence: true
  #validates :availableDates, presence: true
  validates :mansion_id, presence: true
  validates :room_status_id, presence: true
  validates :stayFee, presence: true
  validates :rent, presence: true
  validates :maintenanceFee, presence: true
  validates :contractDuration, presence: true

end
