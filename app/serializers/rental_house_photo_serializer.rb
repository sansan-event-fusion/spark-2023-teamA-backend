Class RentalHousePhotoSerializer < ActiveModel::Serializer
    belongs_to :rental_house
    attributes :id
    attributes :image

    attributes :rental_house_id
end