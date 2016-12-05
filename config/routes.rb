Rails.application.routes.draw do
    resources :importations, only: [ :new, :create, :show]
    resources :contacts, only: [ :index]
    root "importations#new"
end
