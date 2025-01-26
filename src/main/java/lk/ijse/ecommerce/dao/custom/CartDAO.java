package lk.ijse.ecommerce.dao.custom;

import lk.ijse.ecommerce.dao.SuperDAO;
import lk.ijse.ecommerce.entity.Cart;

import java.util.List;

public interface CartDAO extends SuperDAO {

    void save(Cart cart) throws Exception;
    List<Cart> getCartList() throws Exception;
}
/*The `CartDAO` interface defines methods for interacting with the cart data in an e-commerce system.
It includes methods to save a cart (`save(Cart cart)`) and retrieve a list of all carts (`getCartList()`),
extending functionality from `SuperDAO`.*/