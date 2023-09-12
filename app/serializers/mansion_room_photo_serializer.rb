class MansionRoomPhotoSerializer < ActiveModel::Serializer
  belongs_to :mansion_room

  attributes :id
  attributes :image
  attributes :mansion_room_id
end
