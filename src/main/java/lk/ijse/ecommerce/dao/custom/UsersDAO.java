package lk.ijse.ecommerce.dao.custom;

import lk.ijse.ecommerce.dao.SuperDAO;
import lk.ijse.ecommerce.entity.Users;

import java.util.List;

public interface UsersDAO extends SuperDAO {
    void saveUsers(Users user) throws Exception;
    Users checkUser(String username, String password) throws Exception;
    Users checkAdmin(String username, String password) throws Exception;
    List<Users> getAllCustomers() throws Exception;
    void update(Users users) throws Exception;
}
