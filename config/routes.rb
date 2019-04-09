Rails.application.routes.draw do

  root 'api/v1/users#index'

  namespace :api do
    namespace :v1 do
      resources :items
      resources :lists
    end
  end

end
