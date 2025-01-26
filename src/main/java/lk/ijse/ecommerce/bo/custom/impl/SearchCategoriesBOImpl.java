package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.SearchCategoriesBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.CategoriesDAO;
import lk.ijse.ecommerce.dto.CategoriesDTO;
import lk.ijse.ecommerce.entity.Categories;

public class SearchCategoriesBOImpl implements SearchCategoriesBO {

    CategoriesDAO categoriesDAO = (CategoriesDAO) DAOFactory.getDAO(DAOFactory.Type.CATEGORIES);

    @Override
    public CategoriesDTO searchCategory(int categoryId) throws Exception {
        Categories category = categoriesDAO.getCategoryById(categoryId);
        return new CategoriesDTO(category.getCategoryId(), category.getCategoryName(), category.getProducts());
    }
}
