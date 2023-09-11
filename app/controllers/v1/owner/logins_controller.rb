class V1::Owner::LoginsController < ApplicationController
    def create
      owner = Owner.find_by(email: logins_params[:email])
      if owner&.authenticate(logins_params[:password])
        session[:owner_id] = owner.id
  
        render json: owner, serializer: OwnerSerializer, status: :created
      else
        unauthorized
      end
    end
  
    private
  
    def logins_params
        params.require(:login).permit(:email, :password)
    end
  end
  