package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.ViewCategoriesBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.CategoriesDAO;
import lk.ijse.ecommerce.dto.CategoriesDTO;
import lk.ijse.ecommerce.entity.Categories;

import java.util.ArrayList;
import java.util.List;

public class ViewCategoriesBOImpl implements ViewCategoriesBO {

    CategoriesDAO categoriesDAO = (CategoriesDAO) DAOFactory.getDAO(DAOFactory.Type.CATEGORIES);

    @Override
    public List<CategoriesDTO> getAllCategories() throws Exception {
        List<Categories> allCategories = categoriesDAO.getAllCategories();
        List<CategoriesDTO> categoriesDTOList = new ArrayList<>();

        for (Categories categories : allCategories) {
            categoriesDTOList.add(new CategoriesDTO(categories.getCategoryId(), categories.getCategoryName(), categories.getProducts()));
        }

        return categoriesDTOList;
    }

}
