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
public class Products {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int productId;
    private String productName;
    private String description;
    private int quantity;
    private double price;
    private String image;

    @ManyToOne
    @JoinColumn(name = "category_id", foreignKey = @ForeignKey(name = "FK_CATEGORIES"))
    private Categories categories;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "product",cascade = CascadeType.ALL)
    private List<OrderDetails> orderDetails;

    public Products(String productName, String description, int quantity, double price, String image, Categories categories, List<OrderDetails> orderDetails) {
        this.productName = productName;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.categories = categories;
        this.orderDetails = orderDetails;
    }
}
