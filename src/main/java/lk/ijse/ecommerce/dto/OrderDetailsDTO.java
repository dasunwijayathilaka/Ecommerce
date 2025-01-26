package lk.ijse.ecommerce.dto;

import lk.ijse.ecommerce.entity.Orders;
import lk.ijse.ecommerce.entity.Products;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDetailsDTO {
    private int orderDetailsId;
    private int quantity;
    private Products product;
    private Orders order;
}
