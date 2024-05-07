module SalvarObjeto
    extend ActiveSupport::Concern
    
    def salvar(obj)
        obj.save
    end
end