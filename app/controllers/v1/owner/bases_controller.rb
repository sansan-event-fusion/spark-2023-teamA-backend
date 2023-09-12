class V1::Owner::BasesController < ApplicationController
  include ActionController::Cookies
  include OwnerUserAuthenticatable

  before_action :authenticate_owner
end
