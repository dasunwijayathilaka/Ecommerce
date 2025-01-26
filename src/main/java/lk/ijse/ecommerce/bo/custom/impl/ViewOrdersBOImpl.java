package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.ViewOrdersBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.OrdersDAO;
import lk.ijse.ecommerce.dto.OrdersDTO;
import lk.ijse.ecommerce.entity.OrderDetails;
import lk.ijse.ecommerce.entity.Orders;

import java.util.ArrayList;
import java.util.List;

public class ViewOrdersBOImpl implements ViewOrdersBO {

    OrdersDAO ordersDAO = (OrdersDAO) DAOFactory.getDAO(DAOFactory.Type.ORDERS);

    @Override
    public List<OrdersDTO> getAllOrders() throws Exception {
        List<Orders> allOrders = ordersDAO.getAllOrders();
        List<OrdersDTO> ordersDTOList = new ArrayList<>();

        for (Orders orders : allOrders) {
            List<OrderDetails> orderDetails = orders.getOrderDetails();
            for (int i = 0; i < orderDetails.size(); i++) {
                orderDetails.get(i).getProduct().setImage(changeImagePath(orderDetails.get(i).getProduct().getImage()));
            }
            ordersDTOList.add(new OrdersDTO(orders.getOrderId(), orders.getDate(), orders.getTotal(), orderDetails, orders.getUser()));
        }

        return ordersDTOList;
    }

    private String changeImagePath(String path) {

        int uploadsIndex = path.indexOf("uploads");

        if (uploadsIndex != -1) {
            return path.substring(uploadsIndex);
        } else {
            return null;
        }
    }
}
