package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.CategoriesDTO;

public interface SearchCategoriesBO extends SuperBO {

    CategoriesDTO searchCategory(int categoryId) throws Exception;
}
