package lk.ijse.ecommerce.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartDTO {
    private int cartId;
    private int productId;
    private int quantity;

    public CartDTO(int productId, int quantity) {
        this.productId = productId;
        this.quantity = quantity;
    }
}
