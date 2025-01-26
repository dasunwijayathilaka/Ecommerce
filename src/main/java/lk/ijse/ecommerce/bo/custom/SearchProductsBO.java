package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.ProductsDTO;

public interface SearchProductsBO extends SuperBO {

    ProductsDTO searchProducts(int productId) throws Exception;
}
