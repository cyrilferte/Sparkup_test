Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :importations, only: [:index, :new, :create, :show]
resources :contacts
  root "importations#new"
end
