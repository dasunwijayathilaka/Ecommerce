package lk.ijse.ecommerce.dao.custom;

import lk.ijse.ecommerce.dao.SuperDAO;
import lk.ijse.ecommerce.entity.Cart;

import java.util.List;

public interface CartDAO extends SuperDAO {

    void save(Cart cart) throws Exception;
    List<Cart> getCartList() throws Exception;
}
