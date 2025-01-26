package lk.ijse.ecommerce.controller;

import com.google.gson.Gson;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.CartBO;
import lk.ijse.ecommerce.dto.CartDTO;
import lk.ijse.ecommerce.dto.ProductsDTO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {

    CartBO cartBO = (CartBO) BOFactory.getBO(BOFactory.Type.CART);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<CartDTO> cartDTOS = cartBO.getCartDetails();
            req.setAttribute("cart", cartDTOS);

            List<ProductsDTO> allProducts = cartBO.getAllProducts();
            req.setAttribute("products", allProducts);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/cart.jsp");

            requestDispatcher.forward(req, resp);
        } catch (Exception e) {

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            // Retrieve the JSON string from the request
            String productDetailsJson = request.getParameter("productDetails");
            String total = request.getParameter("total");

            // Parse the JSON string into a Java List
            Gson gson = new Gson();
            List<Object> productDetails = gson.fromJson(productDetailsJson, List.class);

            // Debugging
            System.out.println("Product Details: " + productDetails.size());
            System.out.println("Total: " + total);

            cartBO.saveOrder(productDetails, Double.parseDouble(total));

            response.sendRedirect("/E_Commerce_war_exploded/index");
        } catch (Exception e) {
            response.sendRedirect("/E_Commerce_war_exploded/index?message=Order Placed Unsuccessful!!");
        }
    }
}
