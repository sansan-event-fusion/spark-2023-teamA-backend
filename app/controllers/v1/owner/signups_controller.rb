class V1::Owner::SignupsController < ApplicationController
  skip_before_action :verify_authenticity_token
    def create
      owner = Owner.new(signups_params)
      if owner.save
        session[:owner_id] = owner.id
  
        render json: owner, serializer: OwnerSerializer, status: :created
      else
        render_error errors: owner.errors, message: '失敗しました', status: :unprocessable_entity
      end
    end
  
    private
  
    def signups_params
      params.permit(:email, :password, :last_name, :first_name, :phone_number)
    end
end
  