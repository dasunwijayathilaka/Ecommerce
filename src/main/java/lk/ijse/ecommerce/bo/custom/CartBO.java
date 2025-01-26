package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.CartDTO;
import lk.ijse.ecommerce.dto.ProductsDTO;

import java.util.List;

public interface CartBO extends SuperBO {

    List<CartDTO> getCartDetails() throws Exception;
    List<ProductsDTO> getAllProducts() throws Exception;
    void saveOrder(List<Object> productDetails,double total) throws Exception;
}
