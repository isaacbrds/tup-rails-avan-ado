class FornecedoresController < ApplicationController
  def index
    @fornecedores = Fornecedor.all
  end
end
