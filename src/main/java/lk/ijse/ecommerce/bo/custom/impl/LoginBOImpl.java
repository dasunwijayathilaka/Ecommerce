package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.LoginBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.UsersDAO;
import lk.ijse.ecommerce.entity.Users;

public class LoginBOImpl implements LoginBO {

    UsersDAO usersDAO = (UsersDAO) DAOFactory.getDAO(DAOFactory.Type.USERS);

    @Override
    public boolean checkUser(String username, String password) throws Exception {
        Users users = usersDAO.checkUser(username, password);

        if (users == null) {
            return false;
        }
        return true;
    }
}
