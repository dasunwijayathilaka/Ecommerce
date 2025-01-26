package lk.ijse.ecommerce.dao;

import lk.ijse.ecommerce.dao.custom.impl.*;

/*The `DAOFactory` class provides a method to obtain specific DAO implementations based on the type provided.
It uses an enum `Type` to represent different DAO types (like `CART`, `CATEGORIES`, `ORDERS`, etc.).
The `getDAO` method returns the corresponding DAO implementation (`CartDAOImpl`, `CategoriesDAOImpl`, etc.)
based on the `Type` passed in, allowing for easy access to various data operations in the system.*/

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
