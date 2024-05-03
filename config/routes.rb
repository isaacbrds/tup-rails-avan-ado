Rails.application.routes.draw do
  get 'fornecedores', to: 'fornecedores#index'
  resources :clientes
  get 'stimulus', to: 'spa#index'
  root "home#index"
end
