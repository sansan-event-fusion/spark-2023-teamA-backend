class MansionRoom < ApplicationRecord
  belongs_to :mansion

  # バリデーションの設定
  validates :name, presence: true
  validates :layout, presence: true
  validates :thanks_money, presence: true
  validates :security_deposit, presence: true
  validates :floor_number, presence: true
  validates :mansion_id, presence: true
  validates :stay_fee, presence: true
  validates :rent, presence: true
  validates :maintenance_fee, presence: true
  validates :contract_duration, presence: true

end
