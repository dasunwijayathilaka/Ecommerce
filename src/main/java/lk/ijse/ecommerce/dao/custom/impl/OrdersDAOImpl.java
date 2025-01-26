package lk.ijse.ecommerce.dao.custom.impl;

import lk.ijse.ecommerce.dao.custom.OrdersDAO;
import lk.ijse.ecommerce.db.FactoryConfiguration;
import lk.ijse.ecommerce.entity.Orders;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class OrdersDAOImpl implements OrdersDAO{

    @Override
    public List<Orders> getAllOrders() throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        List<Orders> ordersList = session.createQuery("from Orders", Orders.class).list();

        transaction.commit();
        session.close();

        return ordersList;
    }

    @Override
    public void save(Orders orders) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        session.save(orders);

        transaction.commit();
        session.close();
    }
}
