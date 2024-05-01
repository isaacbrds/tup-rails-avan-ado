import { Controller } from "@hotwired/stimulus"
import  renderizarTabela  from "../templates/clientes/index.js";

export default class extends Controller {
  connect() {
    this.loadClientes();
  }

  async loadClientes(){
    const response = await fetch('http://localhost:3000/clientes.json');
    const clientes = await response.json();
    const html = renderizarTabela(clientes);
    this.element.innerHTML = html
  }


}
