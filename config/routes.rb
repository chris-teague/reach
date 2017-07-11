Rails.application.routes.draw do

  resources :locations do
    get :spam_cable, on: :member
  end
  root 'locations#new'

  mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
