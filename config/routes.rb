Rails.application.routes.draw do
  resources :clientes
  get 'stimulus', to: 'spa#index'
  root "home#index"
end
