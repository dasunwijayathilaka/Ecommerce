package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.ManageCustomerBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.UsersDAO;
import lk.ijse.ecommerce.db.FactoryConfiguration;
import lk.ijse.ecommerce.dto.UsersDTO;
import lk.ijse.ecommerce.entity.Users;

import java.util.ArrayList;
import java.util.List;

public class ManageCustomerBOImpl implements ManageCustomerBO {

    UsersDAO usersDAO = (UsersDAO) DAOFactory.getDAO(DAOFactory.Type.USERS);

    @Override
    public List<UsersDTO> getAllCustomers() throws Exception {
        List<Users> allCustomers = usersDAO.getAllCustomers();
        List<UsersDTO> usersDTOS = new ArrayList<>();

        for (Users users : allCustomers) {
            usersDTOS.add(new UsersDTO(users.getUserId(), users.getName(), users.getEmail(), users.getTel(), users.getUserName(), users.getType(), users.getPassword(), users.getOrders()));
        }

        return usersDTOS;
    }

}
