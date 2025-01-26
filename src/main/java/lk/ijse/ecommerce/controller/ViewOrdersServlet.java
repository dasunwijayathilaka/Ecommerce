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

@WebServlet(name = "ViewOrdersServlet", value = "/viewOrders")
public class ViewOrdersServlet extends HttpServlet {

    ViewOrdersBO viewOrdersBO = (ViewOrdersBO) BOFactory.getBO(BOFactory.Type.VIEWORDERS);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<OrdersDTO> allOrders = viewOrdersBO.getAllOrders();

            req.setAttribute("orders", allOrders);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/viewOrders.jsp");

            requestDispatcher.forward(req, resp);
        } catch (Exception e) {

        }
    }
}
