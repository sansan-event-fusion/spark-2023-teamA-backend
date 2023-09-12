class V1::RentalHousesController < ApplicationController
  def index
    @rental_houses = RentalHouse.all
    render json: @rental_houses, include: ['rental_house_photos','mansion','mansion.mansion_rooms','mansion.mansion_rooms.mansion_room_photos'], each_serializer: RentalHouseSerializer, status: :ok
  end
end
