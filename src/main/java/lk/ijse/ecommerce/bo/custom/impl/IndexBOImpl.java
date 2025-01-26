package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.IndexBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.ProductsDAO;
import lk.ijse.ecommerce.dto.ProductsDTO;
import lk.ijse.ecommerce.entity.Products;

import java.util.ArrayList;
import java.util.List;

public class IndexBOImpl implements IndexBO {

    ProductsDAO productsDAO = (ProductsDAO) DAOFactory.getDAO(DAOFactory.Type.PRODUCTS);

    @Override
    public List<ProductsDTO> getAllProducts() throws Exception {
        List<Products> all = productsDAO.getAll();
        List<ProductsDTO> result = new ArrayList<>();

        for (Products product : all) {
            result.add(new ProductsDTO(product.getProductId(), product.getProductName(), product.getDescription(), product.getQuantity(), product.getPrice(), changeImagePath(product.getImage()), product.getCategories(), product.getOrderDetails()));
        }

        return result;
    }

    private String changeImagePath(String path) {

        int uploadsIndex = path.indexOf("uploads");

        if (uploadsIndex != -1) {
            return path.substring(uploadsIndex);
        } else {
            return null;
        }
    }
}
