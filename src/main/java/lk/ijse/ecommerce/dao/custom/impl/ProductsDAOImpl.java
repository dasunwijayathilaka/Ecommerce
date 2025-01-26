package lk.ijse.ecommerce.dao.custom.impl;

import lk.ijse.ecommerce.dao.custom.ProductsDAO;
import lk.ijse.ecommerce.db.FactoryConfiguration;
import lk.ijse.ecommerce.entity.Products;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ProductsDAOImpl implements ProductsDAO {

    @Override
    public void save(Products products) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        session.save(products);

        transaction.commit();
        session.close();
    }

    @Override
    public Products getProducts(int productsId) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        Products products = session.get(Products.class, productsId);

        transaction.commit();
        session.close();

        return products;
    }

    @Override
    public void update(Products products) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        session.update(products);

        transaction.commit();
        session.close();
    }

    @Override
    public void delete(Products products) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        session.delete(products);

        transaction.commit();
        session.close();
    }

    @Override
    public List<Products> getAll() throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        List<Products> productsList = session.createQuery("from Products", Products.class).list();

        transaction.commit();
        session.close();

        return productsList;
    }
}
