require 'csv'

class ClientesCsvWorker
    include Sidekiq::Worker

    def perform(file)
        if File.exist?(file)
            CSV.foreach(file, headers: true) do |linha|
                clientes_params = linha.to_hash.slice('nome', 'telefone', 'endereco')
                Cliente.create(clientes_params)
            end

            File.delete(file)
        end
    end
end