package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.MyProfileBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.UsersDAO;
import lk.ijse.ecommerce.dto.UsersDTO;
import lk.ijse.ecommerce.entity.Users;

public class MyProfileBOImpl implements MyProfileBO {

    UsersDAO usersDAO = (UsersDAO) DAOFactory.getDAO(DAOFactory.Type.USERS);

    @Override
    public UsersDTO getUsers(String username,String password) throws Exception {
        Users users = usersDAO.checkUser(username, password);
        return new UsersDTO(users.getUserId(), users.getName(), users.getEmail(), users.getTel(), users.getUserName(), users.getType(), users.getPassword(), users.getOrders());
    }

    @Override
    public void updateUsers(UsersDTO usersDTO) throws Exception {
        Users user = new Users(usersDTO.getUserId(), usersDTO.getName(), usersDTO.getEmail(), usersDTO.getTel(), usersDTO.getUserName(), usersDTO.getType(), usersDTO.getPassword(), usersDTO.getOrders());
        usersDAO.update(user);
    }
}
