package lk.ijse.ecommerce.dao.custom.impl;

import lk.ijse.ecommerce.dao.custom.CategoriesDAO;
import lk.ijse.ecommerce.db.FactoryConfiguration;
import lk.ijse.ecommerce.entity.Categories;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class CategoriesDAOImpl implements CategoriesDAO {

    @Override
    public Categories getCategories(String categoryName) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        String hql = "FROM Categories WHERE categoryName = :categoryName";
        Categories category = (Categories) session.createQuery(hql)
                .setParameter("categoryName", categoryName)
                .uniqueResult();

        transaction.commit();
        session.close();

        return category;
    }

    @Override
    public void saveCategories(Categories categories) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        session.save(categories);

        transaction.commit();
        session.close();
    }

    @Override
    public void updateCategories(Categories categories) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        session.update(categories);

        transaction.commit();
        session.close();
    }

    @Override
    public void deleteCategories(Categories categories) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        session.delete(categories);

        transaction.commit();
        session.close();
    }

    @Override
    public List<Categories> getAllCategories() throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        List<Categories> categories = session.createQuery("from Categories", Categories.class).list();

        transaction.commit();
        session.close();

        return categories;
    }

    @Override
    public Categories getCategoryById(int categoryId) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        Categories categories = session.get(Categories.class, categoryId);

        transaction.commit();
        session.close();

        return categories;
    }

    @Override
    public List<String> getCategoriesName() throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        List<String> categoriesName = session.createQuery("SELECT categoryName FROM Categories", String.class).list();

        transaction.commit();
        session.close();

        return categoriesName;
    }
}
