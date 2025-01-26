package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.CategoriesDTO;

import java.util.List;

public interface ViewCategoriesBO extends SuperBO {

    List<CategoriesDTO> getAllCategories() throws Exception;
}
