package lk.ijse.ecommerce.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;
    private String name;
    private String email;
    private int tel;
    private String userName;
    private String type;
    private String password;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user",cascade = CascadeType.ALL)
    private List<Orders> orders;

    public Users(String name, String email, int tel, String userName, String type, String password, List<Orders> orders) {
        this.name = name;
        this.email = email;
        this.tel = tel;
        this.userName = userName;
        this.type = type;
        this.password = password;
        this.orders = orders;
    }
}
