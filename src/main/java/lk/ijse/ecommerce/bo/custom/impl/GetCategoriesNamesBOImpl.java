package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.GetCategoriesNamesBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.CategoriesDAO;

import java.util.List;

public class GetCategoriesNamesBOImpl implements GetCategoriesNamesBO {

    CategoriesDAO categoriesDAO = (CategoriesDAO) DAOFactory.getDAO(DAOFactory.Type.CATEGORIES);

    @Override
    public List<String> getCategoriesName() throws Exception {
        return categoriesDAO.getCategoriesName();
    }
}
