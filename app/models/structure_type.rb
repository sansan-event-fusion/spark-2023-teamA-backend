class StructureType < ApplicationRecord
  has_many :rental_houses
  validates :name, presence: true
end
