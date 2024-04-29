Rails.application.routes.draw do
  resources :clientes
  root "clientes#index"
end
