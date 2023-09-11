class V1::RentalHousesController < ApplicationController
  def index
    @rental_houses = RentalHouse.all
    render json: @rental_houses, each_serializer: RentalHouseSerializer, status: :ok
  end
end
