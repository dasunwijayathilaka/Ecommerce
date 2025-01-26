package lk.ijse.ecommerce.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ItemClickServlet", value = "/itemClick")
public class ItemClickServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String quantity = req.getParameter("quantity");

        System.out.println(productId);

        req.setAttribute("productId", productId);
        req.setAttribute("quantity", quantity);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/buyNow.jsp");
        requestDispatcher.forward(req, resp);
    }
}
