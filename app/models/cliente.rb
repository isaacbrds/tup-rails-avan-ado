class Cliente < ApplicationRecord
    has_many :pedidos
    validates :nome, :telefone, presence: true
    validates :nome, length: {minimum: 5, maximum: 150}
end
