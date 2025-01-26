package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;
import lk.ijse.ecommerce.dto.UsersDTO;

import java.util.List;

public interface ManageCustomerBO extends SuperBO {

    List<UsersDTO> getAllCustomers() throws Exception;
}
