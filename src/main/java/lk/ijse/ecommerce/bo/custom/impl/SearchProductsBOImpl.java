package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.SearchProductsBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.ProductsDAO;
import lk.ijse.ecommerce.dto.ProductsDTO;
import lk.ijse.ecommerce.entity.Products;

public class SearchProductsBOImpl implements SearchProductsBO {

    ProductsDAO productsDAO = (ProductsDAO) DAOFactory.getDAO(DAOFactory.Type.PRODUCTS);

    @Override
    public ProductsDTO searchProducts(int productId) throws Exception {
        Products products = productsDAO.getProducts(productId);
        return new ProductsDTO(products.getProductId(), products.getProductName(), products.getDescription(), products.getQuantity(), products.getPrice(), products.getImage(), products.getCategories(), products.getOrderDetails());
    }
}
