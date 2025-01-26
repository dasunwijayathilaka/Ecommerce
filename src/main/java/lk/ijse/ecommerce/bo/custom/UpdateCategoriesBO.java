package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.CategoriesDTO;

public interface UpdateCategoriesBO extends SuperBO {

    void updateCategories(CategoriesDTO categoriesDTO) throws Exception;
    CategoriesDTO getCategories(int categoryId) throws Exception;
}
