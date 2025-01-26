package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.UsersDTO;

public interface MyProfileBO extends SuperBO {

    UsersDTO getUsers(String username, String password) throws Exception;
    void updateUsers(UsersDTO usersDTO) throws Exception;
}
