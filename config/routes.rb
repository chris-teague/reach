Rails.application.routes.draw do

  resources :locations do
    get :expired, on: :member
  end
  root 'locations#new'

  resources :users, only: [:create, :update]

  mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
