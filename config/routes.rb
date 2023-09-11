Rails.application.routes.draw do
  namespace :v1 do
    resources :rental_houses, only: :index

    namespace :owner do
      resource :signup, only: :create
      resource :login, only: :create
      resources :mansions, only: :create do
        resource :mansion_room, only: :create
      end
    end
  end
end