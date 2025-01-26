package lk.ijse.ecommerce.dao.custom;

import lk.ijse.ecommerce.dao.SuperDAO;
import lk.ijse.ecommerce.entity.Orders;

import java.util.List;

public interface OrdersDAO extends SuperDAO {

    List<Orders> getAllOrders() throws Exception;
    void save(Orders orders) throws Exception;
}
