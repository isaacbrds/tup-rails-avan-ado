require 'fileutils'

class CsvController < ApplicationController
  def index
  end

  def upload
    file = params[:file]
    if file.present? && file.content_type == 'text/csv'
      
      caminho_do_arquivo = file.tempfile.path
      diretorio_de_destino = Rails.root.join('public')
      arquivo_de_destino = File.join(diretorio_de_destino, file.original_filename)
      FileUtils.mv(caminho_do_arquivo, arquivo_de_destino)
      
      ClientesCsvWorker.perform_async(arquivo_de_destino)
      
      flash["notice"] = "Estamos processando sua informação"
    else
      flash["error"] = "Por favor, selecione um arquivo .csv"
    end
    redirect_to csv_path
  end
end