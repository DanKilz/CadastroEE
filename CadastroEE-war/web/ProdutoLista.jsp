<%@page import="cadastroee.model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Produtos</title>
        
        <!--Inclusão de Bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body class="container">
        <h1>Listagem de Produtos</h1>
        
        <a href="produto?acao=formIncluir" class="btn btn-primary m-2">Novo Produto</a>
        
        <table class="table table-striped">
            <thead class="table-dark">
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
                        <a href="ServletProdutoFC?acao=formAlterar&id=<%= produto.getIdProduto() %>" class="btn btn-primary btn-sm">
                            Alterar
                        </a>
                        <a href="ServletProdutoFC?acao=excluir&id=<%= produto.getIdProduto() %>" class="btn btn-danger btn-sm">
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
