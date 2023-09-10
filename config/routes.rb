Rails.application.routes.draw do
  namespace :v1 do
    namespace :owner do
      resource :signup, only: :create
      resource :login, only: :create
      namespace :mansion do
        resource :create, only: :create
      end
    end
  end
end