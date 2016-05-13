Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  root "pages#home"

  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"

  resource :users
  
end
