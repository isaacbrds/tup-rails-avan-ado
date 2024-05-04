Rails.application.routes.draw do
  get 'fornecedores', to: 'fornecedores#index'
  get 'fornecedores/novo', to: 'fornecedores#novo'
  post 'fornecedores', to: 'fornecedores#cadastrar', as: 'fonecedores_cadastrar'
  get "fornecedores/:id/editar", to: 'fornecedores#editar', as: 'fornecedores_editar'
  post "fornecedores/:id/alterar", to: 'fornecedores#alterar', as: 'fornecedores_alterar'
  delete "fornecedores/:id", to: 'fornecedores#excluir', as: 'fornecedores_excluir'
  resources :clientes
  get 'stimulus', to: 'spa#index'
  root "home#index"
end
