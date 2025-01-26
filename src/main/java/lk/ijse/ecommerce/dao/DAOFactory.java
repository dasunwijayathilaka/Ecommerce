package lk.ijse.ecommerce.dao;

import lk.ijse.ecommerce.dao.custom.impl.*;

public class DAOFactory {

    public enum Type {
        CART, CATEGORIES, ORDERDETAILS, ORDERS, PRODUCTS, USERS, QUERY
    }

    public static SuperDAO getDAO(Type type) {
        return switch (type) {
            case CART -> new CartDAOImpl();
            case CATEGORIES -> new CategoriesDAOImpl();
            case ORDERDETAILS -> new OrderDetailsDAOImpl();
            case ORDERS -> new OrdersDAOImpl();
            case PRODUCTS -> new ProductsDAOImpl();
            case USERS -> new UsersDAOImpl();
            case QUERY -> new QueryDAOImpl();
            default -> throw new RuntimeException("Invalid DAO type");
        };
    }
}
