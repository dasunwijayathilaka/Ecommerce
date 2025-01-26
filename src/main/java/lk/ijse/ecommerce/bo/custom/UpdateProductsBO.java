package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.ProductsDTO;
import lk.ijse.ecommerce.entity.Categories;

public interface UpdateProductsBO extends SuperBO {

    void updateProduct(ProductsDTO productsDTO) throws Exception;
    Categories getCategories(String categoryName) throws Exception;
}
