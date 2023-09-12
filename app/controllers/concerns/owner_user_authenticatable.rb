# Adminユーザー向けの認証モジュール
module OwnerUserAuthenticatable
  extend ActiveSupport::Concern

  def authenticate_owner
    @current_owner = Owner.find(session[:owner_id])

    unauthorized if @current_owner.nil?
  end
end
