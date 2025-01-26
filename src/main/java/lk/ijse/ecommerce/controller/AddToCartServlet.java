package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.AddToCartBO;
import lk.ijse.ecommerce.dto.CartDTO;

import java.io.IOException;

@WebServlet(name = "AddToCartServlet", value = "/addToCart")
public class AddToCartServlet extends HttpServlet {

    AddToCartBO addToCartBO = (AddToCartBO) BOFactory.getBO(BOFactory.Type.ADDTOCART);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("productId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        try {
            CartDTO cartDTO = new CartDTO(productId, quantity);
            addToCartBO.saveToCart(cartDTO);

            resp.sendRedirect("/E_Commerce_war_exploded/pages/itemClick.jsp?product=" + productId);
        } catch (Exception e) {
            resp.sendRedirect("/E_Commerce_war_exploded/index?message=Cart Added Unsuccessful!!");
        }
    }
}
