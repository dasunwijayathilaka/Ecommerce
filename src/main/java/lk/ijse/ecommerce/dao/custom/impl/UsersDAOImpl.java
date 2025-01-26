package lk.ijse.ecommerce.dao.custom.impl;

import lk.ijse.ecommerce.dao.custom.UsersDAO;
import lk.ijse.ecommerce.db.FactoryConfiguration;
import lk.ijse.ecommerce.entity.Users;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class UsersDAOImpl implements UsersDAO {

    @Override
    public void saveUsers(Users user) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        session.save(user);

        transaction.commit();
        session.close();
    }

    @Override
    public Users checkUser(String username, String password) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        String hql = "FROM Users WHERE userName = :username AND password = :password";
        Users user = session.createQuery(hql, Users.class).setParameter("username", username).setParameter("password", password).uniqueResult();

        transaction.commit();
        session.close();

        return user;
    }

    @Override
    public Users checkAdmin(String username, String password) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        String hql = "FROM Users WHERE userName = :username AND password = :password AND type = :type";
        Users user = session.createQuery(hql, Users.class).setParameter("username", username).setParameter("password", password).setParameter("type","Admin").uniqueResult();

        transaction.commit();
        session.close();

        return user;
    }

    @Override
    public List<Users> getAllCustomers() throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        List<Users> usersList = session.createQuery("FROM Users WHERE type = 'Customer'").list();

        transaction.commit();
        session.close();

        return usersList;
    }

    @Override
    public void update(Users users) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        session.update(users);

        transaction.commit();
        session.close();
    }
}
