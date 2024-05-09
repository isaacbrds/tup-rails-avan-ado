class FornecedoresController < ApplicationLoginController
  before_action :carregar_fornecedor, only: %i[editar mostrar alterar excluir]
  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }
  def index
    @fornecedores = Fornecedor.all
  end

  def novo
    @fornecedor = Fornecedor.new
  end

  def editar
  end

  def mostrar
  end

  def alterar
    
    respond_to do |format|
      if @fornecedor.update(parametros_de_fornecedor)
        format.html { redirect_to fornecedores_url(@fornecedor), notice: "fornecedor was successfully created." }
        format.json { render :mostrar, status: :created, location: @fornecedor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  def cadastrar
    
    # fornecedor = Fornecedor.new(parametros_de_fornecedor)
    # if fornecedor.save
    #   flash[:notice] = "Cadastro realizado com sucesso!"
    #   redirect_to fornecedores_path
    # else
    #   flash[:alert] = "Cadastro não realizado!"
    #   redirect_to fornecedores_novo_path
    # end
    @fornecedor = Fornecedor.new(parametros_de_fornecedor)

    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to fornecedores_url(@fornecedor), notice: "fornecedor was successfully created." }
        format.json { render :mostrar, status: :created, location: @fornecedor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  def excluir
    @fornecedor.destroy!

    respond_to do |format|
      format.html { redirect_to fornecedors_url, notice: "fornecedor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def carregar_fornecedor
    @fornecedor = Fornecedor.find(params[:id])
  end

  def parametros_de_fornecedor
    params.require(:fornecedor).permit(:nome, :cnpj, :endereco)
  end
end
