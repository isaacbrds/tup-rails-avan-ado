# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
puts "Cadastrando os dados"


10.times do
  Cliente.create(
    nome: Faker::Name.name,
    telefone: Faker::PhoneNumber.phone_number,
    endereco: Faker::Address.full_address
  )
end

# Seed data for Produtos
10.times do
  Produto.create(
    nome: Faker::Commerce.product_name,
    descricao: Faker::Lorem.sentence,
    valor: Faker::Commerce.price(range: 10..100),
    quantidade_estoque: Faker::Number.between(from: 0, to: 100)
  )
end

# Seed data for Pedidos
10.times do
  #cliente = Cliente.order("RANDOM()").first
  cliente = Cliente.all.sample
  pedido = Pedido.create(
    cliente_id: cliente.id,
    valor_total: Faker::Commerce.price(range: 50..500),
    data: Faker::Date.between(from: 1.year.ago, to: Date.today),
    endereco_completo: Faker::Address.full_address
  )
  
  # Seed data for PedidoProdutos
  3.times do

    #produto = Produto.order("RANDOM()").first
    produto = Produto.all.sample
    PedidoProduto.create(
      pedido_id: pedido.id,
      produto_id: produto.id,
      valor: produto.valor,
      quantidade: Faker::Number.between(from: 1, to: 5)
  )
  end
end

puts "Finalizando o cadastro"