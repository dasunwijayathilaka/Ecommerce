package lk.ijse.ecommerce.dto;

import lk.ijse.ecommerce.entity.Categories;
import lk.ijse.ecommerce.entity.OrderDetails;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductsDTO {
    private int productId;
    private String productName;
    private String description;
    private int quantity;
    private double price;
    private String image;
    private Categories categories;
    private List<OrderDetails> orderDetails;

    public ProductsDTO(String productName, String description, int quantity, double price, String image, Categories categories, List<OrderDetails> orderDetails) {
        this.productName = productName;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.categories = categories;
        this.orderDetails = orderDetails;
    }

    public ProductsDTO(int productId, String productName, String description, int quantity, double price, Categories categories) {
        this.productId = productId;
        this.productName = productName;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.categories = categories;
    }
}
