package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.DeleteProductsBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.CategoriesDAO;
import lk.ijse.ecommerce.dao.custom.ProductsDAO;
import lk.ijse.ecommerce.dto.ProductsDTO;
import lk.ijse.ecommerce.entity.Categories;
import lk.ijse.ecommerce.entity.Products;

public class DeleteProductsBOImpl implements DeleteProductsBO {

    ProductsDAO productsDAO = (ProductsDAO) DAOFactory.getDAO(DAOFactory.Type.PRODUCTS);
    CategoriesDAO categoriesDAO = (CategoriesDAO) DAOFactory.getDAO(DAOFactory.Type.CATEGORIES);

    @Override
    public void deleteProduct(ProductsDTO productsDTO) throws Exception {
        Products products = productsDAO.getProducts(productsDTO.getProductId());
        productsDAO.delete(new Products(productsDTO.getProductId(), productsDTO.getProductName(),productsDTO.getDescription(),productsDTO.getQuantity(),productsDTO.getPrice(),products.getImage(),productsDTO.getCategories(),products.getOrderDetails()));
    }

    @Override
    public Categories getCategories(String categoryName) throws Exception {
        return categoriesDAO.getCategories(categoryName);
    }
}
