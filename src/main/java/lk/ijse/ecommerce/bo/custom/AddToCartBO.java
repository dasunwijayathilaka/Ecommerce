package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.CartDTO;

public interface AddToCartBO extends SuperBO {

    void saveToCart(CartDTO cartDTO) throws Exception;
}
