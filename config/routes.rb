Rails.application.routes.draw do
  namespace :v1 do
    resources :rental_houses, only: :index do
      resources :mansions, only: :index do
        resources :mansion_rooms, only: :show
      end
    end

    namespace :owner do
      resource :signup, only: :create
      resource :login, only: :create
      resources :rental_houses, only: :index
      resources :mansions, only: :create do
        resources :mansion_rooms, only: %i[create show]
      end
    end
  end
end
