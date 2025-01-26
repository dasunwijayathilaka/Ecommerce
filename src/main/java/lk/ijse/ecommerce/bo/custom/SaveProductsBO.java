package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.CategoriesDTO;
import lk.ijse.ecommerce.dto.ProductsDTO;

public interface SaveProductsBO extends SuperBO {

    void saveProducts(ProductsDTO productsDTO) throws Exception;
    CategoriesDTO getCategories(String categoryName) throws Exception;
}
