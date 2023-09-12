class V1::Owner::RentalHousesController < V1::Owner::BasesController
  def index
    # オーナー個人の持っている物件一覧を取得
    @rental_houses = RentalHouse.where(owner_id: @current_owner.id)
    render json: @rental_houses, each_serializer: RentalHouseSerializer, status: :ok
  end
end
