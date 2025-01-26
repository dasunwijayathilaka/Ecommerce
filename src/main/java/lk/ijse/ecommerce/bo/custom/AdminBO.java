package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;

public interface AdminBO extends SuperBO {

    boolean checkAdmin(String username, String password) throws Exception;
}
