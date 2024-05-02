export default function renderizarTabela(clientes){
    return `
    <h3> Lista de Clientes </h3> 
    <button data-action="click->clientes#clienteForm">Novo Cliente</button>
    <hr>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            ${clientes.map(cliente=>`
                <tr>
                    <td>${cliente.id}</td>
                    <td>${cliente.nome}</td>
                    <td>${cliente.telefone}</td>
                    <td>${cliente.endereco}</td>
                    <td>
                    <button class="btn" data-action="click->clientes#alterar" data-cliente='${JSON.stringify(cliente)}'>Alterar</button>
                    <button class="btn" data-action="click->clientes#excluir" data-cliente='${JSON.stringify(cliente)}'>Excluir</button>
                    </td>
                </tr>
            `).join("")}
        </tbody>
    </table>
    <button data-action="click->clientes#anterior">Anterior</button>
    <button data-action="click->clientes#proximo">Próximo</button>
    `;
}