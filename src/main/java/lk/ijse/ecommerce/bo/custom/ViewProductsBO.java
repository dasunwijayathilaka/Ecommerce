package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.ProductsDTO;

import java.util.List;

public interface ViewProductsBO extends SuperBO {

    List<ProductsDTO> getAllProducts() throws Exception;
}
