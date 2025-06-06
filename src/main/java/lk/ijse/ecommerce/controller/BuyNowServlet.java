package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.BuyNowBO;

import java.io.IOException;

@WebServlet(name = "BuyNowServlet", value = "/buyNow")
public class BuyNowServlet extends HttpServlet {

    BuyNowBO buyNowBO = (BuyNowBO) BOFactory.getBO(BOFactory.Type.BUYNOW);
/*This servlet (BuyNowServlet) processes "Buy Now" requests in an e-commerce application.
It retrieves product ID, quantity, and total price from the HTTP request,
 calls the business layer (BuyNowBO) to save the order, and redirects users based on success or failure.*/

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("productId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        double totalPrice = Double.parseDouble(req.getParameter("total"));

        try {
            buyNowBO.saveOrder(productId,quantity,totalPrice);

            resp.sendRedirect("/E_Commerce_war_exploded/index");
        } catch (Exception e) {
            resp.sendRedirect("/E_Commerce_war_exploded/index?message=Order Placed Unsuccessful!!");
        }
    }
}
