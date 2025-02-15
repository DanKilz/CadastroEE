package cadastroee.servlets;

import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletProdutoFC", urlPatterns = {"/produto"})
public class ServletProdutoFC extends HttpServlet {

    @EJB
    private ProdutoFacadeLocal facade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acao = request.getParameter("acao");
        if (acao == null) acao = "listar";
        
        String destino;
        
        switch (acao) {
            case "formIncluir":
            case "formAlterar":
                destino = "ProdutoDados.jsp";
                break;
            default:
                destino = "ProdutoLista.jsp";
        }
        
        try {
            switch (acao) {
                case "listar":
                    request.setAttribute("listaProdutos", facade.findAll());
                    break;
                    
                case "formAlterar":
                    Integer idAlterar = Integer.parseInt(request.getParameter("id"));
                    Produto produtoAlterar = facade.find(idAlterar);
                    request.setAttribute("produto", produtoAlterar);
                    break;
                    
                case "excluir":
                    Integer idExcluir = Integer.parseInt(request.getParameter("id"));
                    Produto produtoExcluir = facade.find(idExcluir);
                    facade.remove(produtoExcluir);
                    request.setAttribute("listaProdutos", facade.findAll());
                    break;
                    
                case "alterar":
                    Integer id = Integer.parseInt(request.getParameter("id"));
                    Produto produto = facade.find(id);
                    produto.setNome(request.getParameter("nome"));
                    produto.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
                    facade.edit(produto);
                    request.setAttribute("listaProdutos", facade.findAll());
                    break;
                    
                case "incluir":
                    Produto novoProduto = new Produto();
                    novoProduto.setNome(request.getParameter("nome"));
                    novoProduto.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
                    facade.create(novoProduto);
                    request.setAttribute("listaProdutos", facade.findAll());
                    break;
            }
        } catch (NumberFormatException e) {
            throw new ServletException("Erro na conversão de dados", e);
        }
        
        request.getRequestDispatcher(destino).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}