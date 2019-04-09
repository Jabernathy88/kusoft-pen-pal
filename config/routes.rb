Rails.application.routes.draw do

  root 'api/v1/users#index'

  namespace :api do
    namespace :v1 do
      resources :users

    end
  end

end
