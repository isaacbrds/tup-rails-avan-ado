class FornecedoresController < ApplicationController
  before_action :carregar_fornecedor, only: %i[editar alterar excluir]
  def index
    @fornecedores = Fornecedor.all
  end

  def novo
    @fornecedor = Fornecedor.new
  end

  def editar
    
  end

  def alterar
    debugger
    if @fornecedor.update(parametros_de_fornecedor)
      flash[:notice] = "Cadastro atualizado com sucesso!"
      redirect_to fornecedores_path
    else
      flash[:alert] = "Fornecedor não realizado!"
      redirect_to fornecedores_editar_path(@fornecedor)
    end
  end

  def cadastrar
    fornecedor = Fornecedor.new(parametros_de_fornecedor)
    if fornecedor.save
      flash[:notice] = "Cadastro realizado com sucesso!"
      redirect_to fornecedores_path
    else
      flash[:alert] = "Cadastro não realizado!"
      redirect_to fornecedores_novo_path
    end
  end

  def excluir
    @fornecedor.destroy
    flash[:notice] = "Exclusão realizado com sucesso!"
    redirect_to fornecedores_path
  end

  private

  def carregar_fornecedor
    @fornecedor = Fornecedor.find(params[:id])
  end

  def parametros_de_fornecedor
    params.require(:fornecedor).permit(:nome, :cnpj, :endereco)
  end
end
