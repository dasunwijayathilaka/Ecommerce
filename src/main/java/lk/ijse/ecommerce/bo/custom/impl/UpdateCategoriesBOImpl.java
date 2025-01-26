package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.UpdateCategoriesBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.CategoriesDAO;
import lk.ijse.ecommerce.dto.CategoriesDTO;
import lk.ijse.ecommerce.entity.Categories;

public class UpdateCategoriesBOImpl implements UpdateCategoriesBO {

    CategoriesDAO categoriesDAO = (CategoriesDAO) DAOFactory.getDAO(DAOFactory.Type.CATEGORIES);

    @Override
    public void updateCategories(CategoriesDTO categoriesDTO) throws Exception {
        categoriesDAO.updateCategories(new Categories(categoriesDTO.getCategoryId(), categoriesDTO.getCategoryName(), categoriesDTO.getProducts()));
    }

    @Override
    public CategoriesDTO getCategories(int categoryId) throws Exception {
        Categories category = categoriesDAO.getCategoryById(categoryId);
        return new CategoriesDTO(category.getCategoryName(), category.getProducts());
    }
}
