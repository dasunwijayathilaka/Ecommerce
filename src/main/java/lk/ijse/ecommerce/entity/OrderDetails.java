package lk.ijse.ecommerce.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDetails {

    /*The `OrderDetails` class links products to orders,
    containing fields like `orderDetailsId`, `quantity`, and foreign keys to `Products` and `Orders`.
    It establishes many-to-one relationships with these entities using JPA annotations,
    simplifying database operations and management.*/

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int orderDetailsId;
    private int quantity;

    @ManyToOne
    @JoinColumn(name = "product_id", foreignKey = @ForeignKey(name = "FK_PRODUCT"))
    private Products product;

    @ManyToOne
    @JoinColumn(name = "order_id", foreignKey = @ForeignKey(name = "FK_ORDERS"))
    private Orders order;

    public OrderDetails(int quantity, Products product, Orders order) {
        this.quantity = quantity;
        this.product = product;
        this.order = order;
    }

    public OrderDetails(int quantity, Products product) {
        this.quantity = quantity;
        this.product = product;
    }
}
