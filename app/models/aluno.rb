class Aluno
    include Mongoid::Document
    field :nome, type: String
    field :matricula, type: String
    has_many :notas
end