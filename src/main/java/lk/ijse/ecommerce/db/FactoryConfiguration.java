package lk.ijse.ecommerce.db;

import lk.ijse.ecommerce.entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryConfiguration {
    private static SessionFactory sessionFactory;

//    @Resource(name = "jdbc/pool")
//    private static DataSource dataSource;

    /*The `FactoryConfiguration` class configures Hibernate for database interaction.
    It initializes a `SessionFactory` with properties for MySQL dialect, SQL visibility,
    and auto schema update. The class adds entity classes like `Cart`, `Categories`, `Products`, etc.,
     and provides a method (`getSession()`) to retrieve a new Hibernate session.
     This setup is essential for managing database connections and transactions in a Hibernate-based application.*/

    static {
        try {
//            InitialContext ctx = new InitialContext();
//            dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/pool");

            Configuration configuration = new Configuration();

            configuration.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect")
                    .setProperty("hibernate.show_sql", "true")
                    .setProperty("hibernate.hbm2ddl.auto", "update")
                    .setProperty("hibernate.connection.datasource", "java:/comp/env/jdbc/pool");

            configuration.addAnnotatedClass(Cart.class)
                    .addAnnotatedClass(Categories.class)
                    .addAnnotatedClass(OrderDetails.class)
                    .addAnnotatedClass(Orders.class)
                    .addAnnotatedClass(Products.class)
                    .addAnnotatedClass(Users.class);

            sessionFactory = configuration.buildSessionFactory();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError("Failed to initialize Hibernate: " + e);
        }
    }

    public static Session getSession() {
        return sessionFactory.openSession();
    }
}

