class V1::Owner::MansionRoomsController < V1::Owner::BasesController
  before_action :authenticate_owner, only: [:create]

  def create
    # マンションIDをparamsから取得
    mansion_id = params[:mansion_id]

    # マンションIDを使ってマンションを検索
    mansion = Mansion.find_by(id: mansion_id)

    # マンションが見つからない場合のエラーハンドリング
    unless mansion
      render_error errors: message: 'マンションが見つかりません', status: :not_found
      return
    end

    # マンションルームを作成
    mansion_room = MansionRoom.new(mansion_room_params.merge(mansion_id: mansion.id))

    if mansion_room.save
      render json: mansion_room, serializer: MansionRoomSerializer, status: :created
    else
      render_error errors: mansion_room.errors, message: '失敗しました', status: :unprocessable_entity
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
      :availableDates => [],
      :room_status_id,
      :stayFee,
      :rent,
      :maintenanceFee,
      :contractDuration
    )
  end
end
