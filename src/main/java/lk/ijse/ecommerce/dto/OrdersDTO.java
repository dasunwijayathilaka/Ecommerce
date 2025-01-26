package lk.ijse.ecommerce.dto;

import lk.ijse.ecommerce.entity.OrderDetails;
import lk.ijse.ecommerce.entity.Users;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrdersDTO {
    private int orderId;
    private Date date;
    private double total;
    private List<OrderDetails> orderDetails;
    private Users user;

    public OrdersDTO(Date date, double total, List<OrderDetails> orderDetails, Users user) {
        this.date = date;
        this.total = total;
        this.orderDetails = orderDetails;
        this.user = user;
    }
}
