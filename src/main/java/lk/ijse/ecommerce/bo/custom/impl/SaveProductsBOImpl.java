package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.SaveProductsBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.CategoriesDAO;
import lk.ijse.ecommerce.dao.custom.ProductsDAO;
import lk.ijse.ecommerce.dto.CategoriesDTO;
import lk.ijse.ecommerce.dto.ProductsDTO;
import lk.ijse.ecommerce.entity.Categories;
import lk.ijse.ecommerce.entity.Products;

public class SaveProductsBOImpl implements SaveProductsBO {

    ProductsDAO productsDAO = (ProductsDAO) DAOFactory.getDAO(DAOFactory.Type.PRODUCTS);
    CategoriesDAO categoriesDAO = (CategoriesDAO) DAOFactory.getDAO(DAOFactory.Type.CATEGORIES);

    @Override
    public void saveProducts(ProductsDTO productsDTO) throws Exception{
        Products products = new Products(productsDTO.getProductName(), productsDTO.getDescription(), productsDTO.getQuantity(), productsDTO.getPrice(), productsDTO.getImage(), productsDTO.getCategories(), productsDTO.getOrderDetails());
        productsDAO.save(products);
    }

    @Override
    public CategoriesDTO getCategories(String categoryName) throws Exception {
        Categories categories = categoriesDAO.getCategories(categoryName);
        return new CategoriesDTO(categories.getCategoryId(), categories.getCategoryName(), categories.getProducts());
    }
}
