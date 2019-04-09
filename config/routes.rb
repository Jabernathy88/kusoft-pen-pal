Rails.application.routes.draw do

  root 'api/v1/users#index'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :languages
      resources :proficiencies
      resources :messages
    end
  end

end