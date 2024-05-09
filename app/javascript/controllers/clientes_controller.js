import { Controller } from "@hotwired/stimulus"
import  renderizarTabela  from "../templates/clientes/index.js";
import renderizarCliente from "../templates/clientes/new.js"
import { ClientesServicos } from "../servicos/clientes_servico.js";
import { Cliente } from "../models/cliente.js";

export default class extends Controller {
  connect() {
    this.cliente = new Cliente();
    this.paginaCorrente = 1;
    this.loadClientes();
  }
  
  anterior(){
    this.paginaCorrente -= 1;
    if(this.paginaCorrente < 1) {
      this.paginaCorrente = 1
    }

    this.loadClientes();
  }

  proximo(){
    this.paginaCorrente += 1;
    this.loadClientes();
  }

  async loadClientes(){
    this.cliente = new Cliente();
    const clientes = await ClientesServicos.todos(this.paginaCorrente);
    const html = renderizarTabela(clientes);
    this.element.innerHTML = html
  }

  alterar(){
    event.preventDefault();
    this.cliente = JSON.parse(event.currentTarget.dataset.cliente);
    this.clienteForm();
  }

  clienteForm(){
    const authenticity_token = document.querySelector("meta[name=csrf-token]").getAttribute('content')
    const html = renderizarCliente(this.cliente, authenticity_token);
    this.element.innerHTML = html 
  }

  async excluir(event){
    event.preventDefault();
    const cliente = JSON.parse(event.currentTarget.dataset.cliente);
    const authenticity_token = document.querySelector("meta[name=csrf-token]").getAttribute('content')
    await ClientesServicos.delete(cliente.id, authenticity_token)
    this.loadClientes();
  }

  async save(event){
    if(event) {
      event.preventDefault();
    }
    this.cliente.nome = document.getElementById('cliente_nome').value
    this.cliente.telefone = document.getElementById('cliente_telefone').value
    this.cliente.endereco = document.getElementById('cliente_endereco').value

    const authenticity_token = document.querySelector("input[name=authenticity_token]").value

    await ClientesServicos.salvar(this.cliente, authenticity_token)
    this.loadClientes();
  }


}
