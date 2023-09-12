class V1::Owner::RentalHousesController < V1::Owner::BasesController
  def index
    # オーナー個人の持っている物件一覧を取得
    @rental_houses = @current_owner.rental_houses
    render json: @rental_houses, each_serializer: RentalHouseSerializer, status: :ok
  end
end
