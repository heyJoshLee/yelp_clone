Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  get "sign_up", to: "users#new"
  
end
