import { Cliente } from "../models/cliente";

export class ClientesServicos{
    static async todos(paginaCorrente = 1){
        const response = await fetch(`http://localhost:3000/clientes.json?pagina=${paginaCorrente}`);
        const clientesData = await response.json();
        const clientes = clientesData.map(clienteData => new Cliente(clienteData))
        return clientes;
    }

    static async delete(id, authenticity_token){
          
          const payload = {
            authenticity_token: authenticity_token
          }
          
          if(confirm("Deseja realmente excluir o cliente?")){
            const opcoesDaRequisicao = {
              method: "DELETE",
              body: JSON.stringify(payload),
              headers: {"Content-Type": "application/json"}
            }
            const url = `http://localhost:3000/clientes/${id}.json`;
            await fetch(url, opcoesDaRequisicao)
          }
    }

    static async salvar(cliente, authenticity_token){
        const payload = {
            cliente: cliente,
            authenticity_token: authenticity_token
          }
      
          const opcoesDaRequisicao = {
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload)
          }
      
          
          let url = 'http://localhost:3000/clientes.json';
          if (cliente.id < 1 ){
            opcoesDaRequisicao.method = "POST"
          }else{
            opcoesDaRequisicao.method = "PUT"
            url = `http://localhost:3000/clientes/${cliente.id}.json`;
          }
      
          const data = await (await fetch(url, opcoesDaRequisicao)).json();
    }
}
