Rails.application.routes.draw do
  devise_for :useres
  resources :pedido_produtos
  resources :pedidos
  resources :produtos
  get 'fornecedores', to: 'fornecedores#index'
  get 'fornecedores/novo', to: 'fornecedores#novo'
  get "fornecedores/:id", to: 'fornecedores#mostrar', as: 'fornecedores_mostrar'
  post 'fornecedores', to: 'fornecedores#cadastrar', as: 'fonecedores_cadastrar'
  get "fornecedores/:id/editar", to: 'fornecedores#editar', as: 'fornecedores_editar'
  post "fornecedores/:id/alterar", to: 'fornecedores#alterar', as: 'fornecedores_alterar'
  delete "fornecedores/:id", to: 'fornecedores#excluir', as: 'fornecedores_excluir'
  resources :clientes
  get 'stimulus', to: 'spa#stimulus'
  get 'jquery', to: 'spa#jquery'
  get 'hotwire', to: 'spa#hotwire'
  root "home#index"
end
