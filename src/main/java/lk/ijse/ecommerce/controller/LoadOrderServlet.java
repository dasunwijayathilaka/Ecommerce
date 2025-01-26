package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.ViewOrdersBO;
import lk.ijse.ecommerce.dto.OrdersDTO;

import javax.json.Json;
import javax.json.JsonObjectBuilder;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/loadOrders" )
public class LoadOrderServlet extends HttpServlet {

    ViewOrdersBO viewOrdersBO = (ViewOrdersBO) BOFactory.getBO(BOFactory.Type.VIEWORDERS);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderDetailsIndex = Integer.parseInt(req.getParameter("orderDetailsIndex"));
        int productDetailsIndex = Integer.parseInt(req.getParameter("productDetailsIndex"));

        try {
            List<OrdersDTO> allOrders = viewOrdersBO.getAllOrders();

            JsonObjectBuilder objectBuilder = Json.createObjectBuilder();
            objectBuilder.add("orderId", allOrders.get(orderDetailsIndex).getOrderId())
                    .add("customerId", allOrders.get(orderDetailsIndex).getUser().getUserId())
                    .add("orderDate", allOrders.get(orderDetailsIndex).getDate().toString())
                    .add("productId", allOrders.get(orderDetailsIndex).getOrderDetails().get(productDetailsIndex).getProduct().getProductId())
                    .add("productName", allOrders.get(orderDetailsIndex).getOrderDetails().get(productDetailsIndex).getProduct().getProductName())
                    .add("description", allOrders.get(orderDetailsIndex).getOrderDetails().get(productDetailsIndex).getProduct().getDescription())
                    .add("category", allOrders.get(orderDetailsIndex).getOrderDetails().get(productDetailsIndex).getProduct().getCategories().getCategoryName())
                    .add("image", allOrders.get(orderDetailsIndex).getOrderDetails().get(productDetailsIndex).getProduct().getImage())
                    .add("quantity", allOrders.get(orderDetailsIndex).getOrderDetails().get(productDetailsIndex).getQuantity())
                    .add("total", allOrders.get(orderDetailsIndex).getTotal());
            resp.setContentType("application/json");
            resp.getWriter().write(objectBuilder.build().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
