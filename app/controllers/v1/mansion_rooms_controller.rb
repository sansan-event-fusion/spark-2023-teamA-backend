class V1::MansionRoomsController < ApplicationController
  def show
    # マンションルームIDとレンタルIDをparamsから取得
    mansion_room_id = params[:id]
    rental_house_id = params[:rental_house_id]

    # マンションルームとレンタルハウスを取得
    @mansion_room = MansionRoom.find_by(id: mansion_room_id)
    @rental_house = RentalHouse.find_by(id: rental_house_id)

    if @mansion_room.mansion_id != @rental_house.mansion.id
      render_error(message: 'マンションとルームが一致しません', status: :not_match) 
    end

    if @mansion_room
      render json: mansion_room_json.merge(rental_house_json), status: :ok
    else
      render_error(message: 'マンションルームが見つかりません', status: :not_found)
    end
  end

  def mansion_room_json
    ActiveModelSerializers::SerializableResource.new(
      @mansion_room, serializer: MansionRoomSerializer, adapter: :json
    ).serializable_hash
  end

  def rental_house_json
    ActiveModelSerializers::SerializableResource.new(
      @rental_house, serializer: RentalHouseSerializer, adapter: :json
    ).serializable_hash
  end

  private

  def mansion_room_params
    params.require(:mansion_room).permit(
      :name,
      :layout,
      :thanks_money,
      :security_deposit,
      :floor_number,
      :room_status_id,
      :stay_fee,
      :rent,
      :maintenance_fee,
      :contract_duration,
      mansion_room_photos: [:image]
    )
  end
end
