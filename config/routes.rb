Rails.application.routes.draw do
  get 'home/index'
  resources :clientes
  root "home#index"
end
