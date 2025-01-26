package lk.ijse.ecommerce.dto;

import lk.ijse.ecommerce.entity.Orders;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UsersDTO {
    private int userId;
    private String name;
    private String email;
    private int tel;
    private String userName;
    private String type;
    private String password;
    private List<Orders> orders;

    public UsersDTO(String name, String email, int tel, String userName, String type, String password, List<Orders> orders) {
        this.name = name;
        this.email = email;
        this.tel = tel;
        this.userName = userName;
        this.type = type;
        this.password = password;
        this.orders = orders;
    }
}
