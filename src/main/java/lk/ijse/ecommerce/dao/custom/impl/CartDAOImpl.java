package lk.ijse.ecommerce.dao.custom.impl;

import lk.ijse.ecommerce.dao.custom.CartDAO;
import lk.ijse.ecommerce.db.FactoryConfiguration;
import lk.ijse.ecommerce.entity.Cart;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class CartDAOImpl implements CartDAO {

    @Override
    public void save(Cart cart) throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        session.save(cart);

        transaction.commit();
        session.close();
    }

    @Override
    public List<Cart> getCartList() throws Exception {
        Session session = FactoryConfiguration.getSession();
        Transaction transaction = session.beginTransaction();

        List<Cart> cartList = session.createQuery("from Cart", Cart.class).list();

        transaction.commit();
        session.close();

        return cartList;
    }
}

/*The `CartDAOImpl` class implements the `CartDAO` interface, using Hibernate for database operations.
 It saves a `Cart` object with a transaction in
 `save(Cart cart)` and retrieves all carts with `getCartList()` by executing a query.*/
