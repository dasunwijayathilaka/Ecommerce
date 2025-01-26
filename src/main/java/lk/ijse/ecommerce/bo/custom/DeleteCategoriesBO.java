package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.CategoriesDTO;

public interface DeleteCategoriesBO extends SuperBO {

    void deleteCategories(CategoriesDTO categoriesDTO) throws Exception;
    CategoriesDTO getCategories(int categoryId) throws Exception;
}
