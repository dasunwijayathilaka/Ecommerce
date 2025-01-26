package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.BuyNowBO;
import lk.ijse.ecommerce.controller.LoginServlet;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.OrdersDAO;
import lk.ijse.ecommerce.dao.custom.ProductsDAO;
import lk.ijse.ecommerce.dao.custom.UsersDAO;
import lk.ijse.ecommerce.entity.OrderDetails;
import lk.ijse.ecommerce.entity.Orders;
import lk.ijse.ecommerce.entity.Products;
import lk.ijse.ecommerce.entity.Users;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class BuyNowBOImpl implements BuyNowBO {

    ProductsDAO productsDAO = (ProductsDAO) DAOFactory.getDAO(DAOFactory.Type.PRODUCTS);
    UsersDAO usersDAO = (UsersDAO) DAOFactory.getDAO(DAOFactory.Type.USERS);
    OrdersDAO ordersDAO = (OrdersDAO) DAOFactory.getDAO(DAOFactory.Type.ORDERS);

    @Override
    public void saveOrder(int productId,int quantity,double total) throws Exception {
        Products products = productsDAO.getProducts(productId);
        Users users = usersDAO.checkUser(LoginServlet.username, LoginServlet.password);

        List<OrderDetails> orderDetails = new ArrayList<>();
        orderDetails.add(new OrderDetails(quantity, products));

        Orders orders = new Orders(Date.valueOf(LocalDate.now()), total, orderDetails, users);

        for (OrderDetails details : orders.getOrderDetails()) {
            details.setOrder(orders);
        }
        ordersDAO.save(orders);
    }
}
