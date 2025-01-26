package lk.ijse.ecommerce.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int orderId;
    private Date date;
    private double total;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "order",cascade = CascadeType.ALL)
    private List<OrderDetails> orderDetails;

    @ManyToOne
    @JoinColumn(name = "user_id", foreignKey = @ForeignKey(name = "FK_USER"))
    private Users user;

    public Orders(Date date, double total, List<OrderDetails> orderDetails, Users user) {
        this.date = date;
        this.total = total;
        this.orderDetails = orderDetails;
        this.user = user;
    }
}
