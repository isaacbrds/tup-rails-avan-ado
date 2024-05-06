#require 'pg'
require 'yaml'
module Repositorios
    class ClienteActiveRecordRepositorio
      def initialize(cliente)
        @cliente = cliente
      end
  
      def salvar(cliente)
        @cliente.save
      end
  
      def encontrar_por_id(id)
        @clientes.find(id) 
      end
  
      def listar_todos( pagina = 1 )
        pagina = pagina.to_i 
        pagina = 1 if pagina < 1
        quantidade_por_pagina = 4
        offset = (pagina - 1) * quantidade_por_pagina
        @clientes = Cliente.order(id: :desc).limit(quantidade_por_pagina).offset(offset)
      end
  
      def deletar
        @cliente.destroy
      end
    end
  end