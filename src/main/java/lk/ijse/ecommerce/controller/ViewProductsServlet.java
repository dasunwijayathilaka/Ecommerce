package lk.ijse.ecommerce.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.ViewProductsBO;
import lk.ijse.ecommerce.dto.ProductsDTO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewProductsServlet", value = "/viewProducts")
public class ViewProductsServlet extends HttpServlet {

    ViewProductsBO viewProductsBO = (ViewProductsBO) BOFactory.getBO(BOFactory.Type.VIEWPRODUCTS);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<ProductsDTO> allProducts = viewProductsBO.getAllProducts();

            req.setAttribute("products", allProducts);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/viewProducts.jsp");

            requestDispatcher.forward(req, resp);
        } catch (Exception e) {

        }
    }
}
