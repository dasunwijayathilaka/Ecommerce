package lk.ijse.ecommerce.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.ViewOrdersBO;
import lk.ijse.ecommerce.dto.OrdersDTO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MyOrdersServlet", value = "/myOrders")
public class MyOrdersServlet extends HttpServlet {

    ViewOrdersBO viewOrdersBO = (ViewOrdersBO) BOFactory.getBO(BOFactory.Type.VIEWORDERS);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<OrdersDTO> allOrders = viewOrdersBO.getAllOrders();

            req.setAttribute("orders", allOrders);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/myOrders.jsp");

            requestDispatcher.forward(req, resp);
        } catch (Exception e) {

        }
    }
}
