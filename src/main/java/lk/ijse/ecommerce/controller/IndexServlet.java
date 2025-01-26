package lk.ijse.ecommerce.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.IndexBO;
import lk.ijse.ecommerce.dto.ProductsDTO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "IndexServlet", urlPatterns = "/index")
public class IndexServlet extends HttpServlet {

    IndexBO indexBO = (IndexBO) BOFactory.getBO(BOFactory.Type.Index);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<ProductsDTO> allProducts = indexBO.getAllProducts();

            req.setAttribute("products", allProducts);

            String message = req.getParameter("message");
            String checked = req.getParameter("checked");
            String username = req.getParameter("username");

            if (checked == null && username == null){
                req.getRequestDispatcher("index.jsp?message=" + message).forward(req,resp);
            } else if (checked != null && username != null && message != null){
                req.getRequestDispatcher("index.jsp?message=" + message + "&checked=" + checked + "&username=" + username).forward(req,resp);
            } else {
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }
        } catch (Exception e) {

        }
    }
}
