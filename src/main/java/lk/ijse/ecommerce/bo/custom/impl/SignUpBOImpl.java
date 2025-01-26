package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.SignUpBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.UsersDAO;
import lk.ijse.ecommerce.dto.UsersDTO;
import lk.ijse.ecommerce.entity.Users;

public class SignUpBOImpl implements SignUpBO {

    UsersDAO usersDAO = (UsersDAO) DAOFactory.getDAO(DAOFactory.Type.USERS);

    @Override
    public void saveUsers(UsersDTO usersDTO) throws Exception {
        Users user = new Users(usersDTO.getName(), usersDTO.getEmail(), usersDTO.getTel(), usersDTO.getUserName(), usersDTO.getType(), usersDTO.getPassword(), usersDTO.getOrders());
        usersDAO.saveUsers(user);
    }
}
