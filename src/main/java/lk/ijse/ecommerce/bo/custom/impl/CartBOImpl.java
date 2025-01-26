package lk.ijse.ecommerce.bo.custom.impl;

import com.google.gson.Gson;
import lk.ijse.ecommerce.bo.custom.CartBO;
import lk.ijse.ecommerce.controller.LoginServlet;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.CartDAO;
import lk.ijse.ecommerce.dao.custom.OrdersDAO;
import lk.ijse.ecommerce.dao.custom.ProductsDAO;
import lk.ijse.ecommerce.dao.custom.UsersDAO;
import lk.ijse.ecommerce.dto.CartDTO;
import lk.ijse.ecommerce.dto.ProductsDTO;
import lk.ijse.ecommerce.entity.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CartBOImpl implements CartBO {

    CartDAO cartDAO = (CartDAO) DAOFactory.getDAO(DAOFactory.Type.CART);
    ProductsDAO productsDAO = (ProductsDAO) DAOFactory.getDAO(DAOFactory.Type.PRODUCTS);
    UsersDAO usersDAO = (UsersDAO) DAOFactory.getDAO(DAOFactory.Type.USERS);
    OrdersDAO ordersDAO = (OrdersDAO) DAOFactory.getDAO(DAOFactory.Type.ORDERS);

    @Override
    public List<CartDTO> getCartDetails() throws Exception {
        List<Cart> cartList = cartDAO.getCartList();
        List<CartDTO> cartDTOList = new ArrayList<>();

        for (Cart cart : cartList) {
            cartDTOList.add(new CartDTO(cart.getCartId(), cart.getProductId(), cart.getQuantity()));
        }

        return cartDTOList;
    }

    @Override
    public List<ProductsDTO> getAllProducts() throws Exception {
        List<Products> all = productsDAO.getAll();
        List<ProductsDTO> result = new ArrayList<>();

        for (Products product : all) {
            result.add(new ProductsDTO(product.getProductId(), product.getProductName(), product.getDescription(), product.getQuantity(), product.getPrice(), changeImagePath(product.getImage()), product.getCategories(), product.getOrderDetails()));
        }

        return result;
    }

    private String changeImagePath(String path) {

        int uploadsIndex = path.indexOf("uploads");

        if (uploadsIndex != -1) {
            return path.substring(uploadsIndex);
        } else {
            return null;
        }
    }

    @Override
    public void saveOrder(List<Object> productDetails,double total) throws Exception {
        List<OrderDetails> orderDetails = new ArrayList<>();
        Gson gson = new Gson();
        for (Object obj : productDetails) {
            // Parse JSON string into a Map
            Map<String, Object> detailMap = gson.fromJson(obj.toString(), Map.class);

            int productId = ((Double) detailMap.get("productId")).intValue(); // Cast Double to int
            int quantity = ((Double) detailMap.get("quantity")).intValue();

            Products products = productsDAO.getProducts(productId);
            orderDetails.add(new OrderDetails(quantity, products));
        }


        Users users = usersDAO.checkUser(LoginServlet.username, LoginServlet.password);
        Orders orders = new Orders(Date.valueOf(LocalDate.now()), total, orderDetails, users);

        for (OrderDetails details : orders.getOrderDetails()) {
            details.setOrder(orders);
        }
        ordersDAO.save(orders);
    }
}
