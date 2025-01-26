package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.UsersDTO;

public interface LoginBO extends SuperBO {

    boolean checkUser(String username, String password) throws Exception;
}
