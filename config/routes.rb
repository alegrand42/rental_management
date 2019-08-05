Rails.application.routes.draw do
  Rails.application.routes.draw do
    namespace :api do
        namespace :v1 do
            resources :listings, only: [:index, :show, :create]
            resources :bookings
            resources :reservations
            resources :missions
        end
    end
end
end
