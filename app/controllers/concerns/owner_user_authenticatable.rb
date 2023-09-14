# Adminユーザー向けの認証モジュール
module OwnerUserAuthenticatable
  extend ActiveSupport::Concern

  def authenticate_owner
    owner_id_from_header = request.headers['Authorization'].split(' ')[1]

    @current_owner = Owner.find_by(id: owner_id_from_header)

    unauthorized if @current_owner.nil?
  end
end

