package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.OrdersDTO;

import java.util.List;

public interface ViewOrdersBO extends SuperBO {

    List<OrdersDTO> getAllOrders() throws Exception;
}
