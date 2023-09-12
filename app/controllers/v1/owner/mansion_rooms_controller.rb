class V1::Owner::MansionRoomsController < V1::Owner::BasesController
  def index
    # レンタルハウスIDをparamsから取得
    rental_house = RentalHouse.find_by(owner_id: @current_owner.id, id: params[:rental_house_id])

    if rental_house
      render json: rental_house, include: ['rental_house_photos','mansion','mansion.mansion_rooms','mansion.mansion_rooms.mansion_room_photos'], serializer: RentalHouseSerializer, status: :ok
    else
      render_error(message: 'レンタルハウスが見つかりません', status: :not_found)
    end
  end

  def create
    # マンションIDをparamsから取得
    mansion_id = params[:mansion_id]

    # マンションルームを作成
    form = MansionRoomRegistrationForm.new(mansion_room_params.merge(mansion_id: mansion_id))

    if form.save
      render json: form.saved_mansion_room, serializer: MansionRoomSerializer, status: :created
    else
      render_error(errors: form.saved_mansion_room.errors, message: '失敗しました', status: :unprocessable_entity)
    end
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
