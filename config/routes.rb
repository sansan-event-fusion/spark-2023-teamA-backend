Rails.application.routes.draw do
  namespace :v1 do
    namespace :owner do
      resource :signup, only: :create
      resource :login, only: :create
      resource :mansion, only: :create
    end
  end
end