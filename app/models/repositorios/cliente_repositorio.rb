#require 'pg'
require 'yaml'
module Repositorios
    class ClienteRepositorio
      def initialize
        database_config = YAML.safe_load(File.read("#{Rails.root}/config/database.yml"), aliases: true)
        database_config = database_config[Rails.env]

        @conexao = PG::Connection.new(
            host: database_config['host'],
            port: database_config['port'],
            dbname: database_config['database'],
            user: database_config['username'],
            password: database_config['password']
        )
        @ultimo_id = 0
      end
  
      def salvar(cliente)
        if cliente.id.nil?
          @ultimo_id += 1
          cliente.id = @ultimo_id
          @clientes << cliente
        else
          index = @clientes.find_index { |c| c.id == cliente.id }
          @clientes[index] = cliente if index
        end
      end
  
      def encontrar_por_id(id)
        @clientes.find { |cliente| cliente.id == id }
      end
  
      def listar_todos
        query = "SELECT * FROM clientes"
        resultado = @conexao.exec(query)
  
        clientes = []
        resultado.each do |row|
          cliente = Entidades::Cliente.new
          cliente.id = row['id']
          cliente.nome = row['nome']
          cliente.endereco = row['endereco']
          cliente.telefone = row['telefone']
          clientes << cliente
        end
  
        clientes
      end
  
      def deletar(cliente)
        @clientes.delete(cliente)
      end
    end
  end