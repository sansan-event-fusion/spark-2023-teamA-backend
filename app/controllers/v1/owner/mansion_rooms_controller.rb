class V1::Owner::MansionRoomsController < V1::Owner::BasesController
  def show
    # マンションルームIDをparamsから取得
    mansion_room_id = params[:id]

    # マンションルームを取得
    mansion_room = MansionRoom.find_by(id: mansion_room_id)

    if mansion_room
      render json: mansion_room, serializer: MansionRoomSerializer, status: :ok
    else
      render_error(message: 'マンションルームが見つかりません', status: :not_found)
    end
  end

  def create
    # マンションIDをparamsから取得
    mansion_id = params[:mansion_id]

    # マンションルームを作成
    form = MansionRoomRegistrationForm.new(mansion_room_params.merge(mansion_id:))

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
      :reserve_url,
      mansion_room_photos: [:image]
    )
  end
end
