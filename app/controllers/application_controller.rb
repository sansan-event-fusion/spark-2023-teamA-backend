class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include ErrorHandler
  # protect_from_forgery with: :null_session
end
