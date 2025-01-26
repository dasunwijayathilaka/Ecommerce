package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.UsersDTO;

public interface SignUpBO extends SuperBO {

    void saveUsers(UsersDTO usersDTO) throws Exception;
}
