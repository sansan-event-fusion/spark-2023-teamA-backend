class V1::Owner::MansionsController < V1::Owner::BasesController
      def create
        form = RentalHouseMansionRegistrationForm.new(rental_house_params.merge(owner_id: @current_owner.id))
        if form.save
          render json: form.saved_mansion, serializer: MansionSerializer, status: :created
        else
          render_error errors: form.saved_mansion.errors, message: '失敗しました', status: :unprocessable_entity
        end
      end
    
      private
    
      def rental_house_params
        params.require(:rental_house).permit(
          :name, 
          :address, 
          :nearest_station,
          :structure_type_id, 
          :max_floor_number, 
          :building_age, 
          rental_house_photos: [:image],
        )
      end
end
    