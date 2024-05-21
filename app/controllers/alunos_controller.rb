class AlunosController < ApplicationController
  def index
    # 3.times do
    #   aluno = Aluno.create!(
    #     nome: Faker::Name.name,
    #     matricula: Faker::Number.unique.number(digits: 6).to_s,
    #   )
    
    #   5.times do
    #     aluno.notas.create!(
    #       nota: Faker::Number.between(from: 0, to: 10),
    #       data: Faker::Date.between(from: 30.days.ago, to: Date.today)
    #     )
    #   end
    # end
    @alunos = Aluno.all
  end
end
