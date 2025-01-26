package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.AdminBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.UsersDAO;
import lk.ijse.ecommerce.entity.Users;

public class AdminBOImpl implements AdminBO {

    UsersDAO usersDAO = (UsersDAO) DAOFactory.getDAO(DAOFactory.Type.USERS);

    @Override
    public boolean checkAdmin(String username, String password) throws Exception {
        Users users = usersDAO.checkAdmin(username, password);

        if (users == null) {
            return false;
        }
        return true;
    }
}
