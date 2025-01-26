package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.SaveCategoriesBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.CategoriesDAO;
import lk.ijse.ecommerce.dto.CategoriesDTO;
import lk.ijse.ecommerce.entity.Categories;

public class SaveCategoriesBOImpl implements SaveCategoriesBO {

    CategoriesDAO categoriesDAO = (CategoriesDAO) DAOFactory.getDAO(DAOFactory.Type.CATEGORIES);

    @Override
    public void saveCategory(CategoriesDTO categoriesDTO) throws Exception {
        Categories categories = new Categories(categoriesDTO.getCategoryName(), categoriesDTO.getProducts());
        categoriesDAO.saveCategories(categories);
    }
}
