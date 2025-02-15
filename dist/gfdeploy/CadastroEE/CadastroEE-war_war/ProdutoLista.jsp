<%@page import="cadastroee.model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Produtos</title>
        
        <style>
            table {
                border-collapse: collapse;
                width: 60%;
            }
            
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            
            th {
                background-color: #f2f2f2;
            }
            
            a {
              text-decoration: none;
              margin-right: 10px;
            }
            
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <h1>Listagem de Produtos</h1>
        
        <a href="produto?acao=formIncluir">Novo Produto</a>
        
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Nome</th>
                    <th>Quantidade</th>
                    <th>Preço de Venda</th>
                    <th>Opções</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
                    
                    if (produtos != null) {
                        for (Produto produto : produtos) {                    
                %>
                    
                <tr>
                    <td><%= produto.getIdProduto() %></td>
                    <td><%= produto.getNome() %></td>
                    <td><%= produto.getQuantidade() %></td>
                    <td><%= String.format("%.2f", produto.getPrecoVenda()) %></td>
                    <td>
                        <<a href="ServletProdutoFC?acao=formAlterar&id=<%= produto.getIdProduto() %>">
                            Alterar
                        </a>
                        <a href="ServletProdutoFC?acao=excluir&id=<%= produto.getIdProduto() %>">
                            Excluir
                        </a>
                    </td>
                </tr>
                    
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
