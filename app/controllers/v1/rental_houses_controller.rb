class V1::RentalHousesController < ApplicationController
  def index
    @rental_houses = RentalHouse.all

    if @rental_houses.blank?
      render_error errors: @rental_houses.errors, message: "登録はありません", status: :not_found
    else
      render json: @rental_houses, serializer: RentalHouseSerializer, status: :ok
    end

  end
end
