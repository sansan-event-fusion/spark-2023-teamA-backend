class V1::Owner::MansionRoomsController < V1::Owner::BasesController
  before_action :authenticate_owner, only: [:create]

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
      :thanksMoney,
      :securityDeposit,
      :floorNumber,
      :room_status_id,
      :stayFee,
      :rent,
      :maintenanceFee,
      :contractDuration,
      mansion_room_photos: [:image]
    )
  end
end
