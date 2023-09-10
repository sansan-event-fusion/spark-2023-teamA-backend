class V1::Owner::MansionsController < ApplicationController
  skip_before_action :verify_authenticity_token
      def new
        @form = RentalHouseMansionRegistrationForm.new
      end
    
      def create
        form = RentalHouseMansionRegistrationForm.new(rental_house_params)
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
          :structure_type_id, 
          :maxFloorNumber, 
          :buildingAge, 
          :owner_id,
          rental_house_photos: [:image],
        )
      end
end
    