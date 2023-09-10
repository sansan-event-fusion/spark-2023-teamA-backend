# app/controllers/rental_houses_controller.rb

class V1::RentalHousesController < ApplicationController
  # GET /rentalHouses
  def index
    @rental_houses = RentalHouse.all
    # @rental_housesをJSON形式で返す
    render json: @rental_houses, each_serializer: RentalHouseSerializer, status: :ok
  end
end
