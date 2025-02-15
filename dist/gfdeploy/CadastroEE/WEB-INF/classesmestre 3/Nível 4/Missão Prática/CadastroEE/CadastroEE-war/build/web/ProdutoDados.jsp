<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="cadastroee.model.Produto" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dados do Produto</title>
        
        <!--Inclusão de Bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body class="container">
        <%
            Produto produto = (Produto) request.getAttribute("produto");
            String acao = (produto == null) ? "incluir" : "alterar";
        %>

        <h2>Dados do Produto</h2>

        <form action="ServletProdutoFC" method="post" class="form">
            <input type="hidden" name="acao" value="<%= acao%>">

            <% if (acao.equals("alterar")) {%>
            <input type="hidden" name="id" value="<%= produto.getIdProduto()%>">
            <% }%>

            <div class="mb-3">
                <label for="nome" class="form-label">Nome:</label>
                <input type="text" id="nome" name="nome" 
                       value="<%= (produto != null) ? produto.getNome() : ""%>"
                       class="form-control">
            </div>

            <div class="mb-3">
                <label for="quantidade" class="form-label">Quantidade:</label>
                <input type="number" id="quantidade" name="quantidade" 
                       value="<%= (produto != null) ? produto.getQuantidade() : ""%>"
                       class="form-control">
            </div>

            <div class="mb-3">
                <label for="precoVenda" class="form-label">Preço de Venda:</label>
                <input type="number" step="0.01" id="precoVenda" name="precoVenda" 
                       value="<%= (produto != null) ? produto.getPrecoVenda() : ""%>"
                       class="form-control">
            </div>

            <div class="mb-3">
                <input type="submit"
                       value="<%= acao.equals("incluir") ? "Adicionar Produto" : "Alterar Produto"%>"
                       class="btn btn-primary ">
            </div>
        </form>
    </body>
</html>