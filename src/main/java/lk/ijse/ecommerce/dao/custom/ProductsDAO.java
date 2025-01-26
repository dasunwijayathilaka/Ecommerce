package lk.ijse.ecommerce.dao.custom;

import lk.ijse.ecommerce.dao.SuperDAO;
import lk.ijse.ecommerce.entity.Products;

import java.util.List;

public interface ProductsDAO extends SuperDAO {

    void save(Products products) throws Exception;
    Products getProducts(int productsId) throws Exception;
    void update(Products products) throws Exception;
    void delete(Products products) throws Exception;
    List<Products> getAll() throws Exception;
}
