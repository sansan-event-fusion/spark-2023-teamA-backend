Rails.application.routes.draw do
  namespace :v1 do
    resources :rental_houses, only: :index

    namespace :owner do
      resource :signup, only: :create
      resource :login, only: :create
      resources :rental_houses, only: :index
      resources :mansions, only: :create do
        resources :mansion_rooms, only: [ :create, :show ]
      end
    end
  end
end