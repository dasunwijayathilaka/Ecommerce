package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.DeleteCategoriesBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.CategoriesDAO;
import lk.ijse.ecommerce.dto.CategoriesDTO;
import lk.ijse.ecommerce.entity.Categories;

public class DeleteCategoriesBOImpl implements DeleteCategoriesBO {

    CategoriesDAO categoriesDAO = (CategoriesDAO) DAOFactory.getDAO(DAOFactory.Type.CATEGORIES);

    @Override
    public void deleteCategories(CategoriesDTO categoriesDTO) throws Exception {
        categoriesDAO.deleteCategories(new Categories(categoriesDTO.getCategoryId(), categoriesDTO.getCategoryName(), categoriesDTO.getProducts()));
    }

    @Override
    public CategoriesDTO getCategories(int categoryId) throws Exception {
        Categories category = categoriesDAO.getCategoryById(categoryId);
        return new CategoriesDTO(category.getCategoryName(), category.getProducts());
    }
}
