package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.CategoriesDTO;

public interface SaveCategoriesBO extends SuperBO {

    void saveCategory(CategoriesDTO categoriesDTO) throws Exception;
}
