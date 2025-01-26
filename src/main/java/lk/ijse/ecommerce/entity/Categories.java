package lk.ijse.ecommerce.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/*The `Categories` class represents a category entity in the database.
It has fields for `categoryId`, `categoryName`, and a list of `products`. A one-to-many relationship is established with `Products`,
 and cascading operations ensure related products are managed automatically.*/

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Categories {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String categoryName;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "categories",cascade = CascadeType.ALL)
    private List<Products> products;

    public Categories(String categoryName, List<Products> products) {
        this.categoryName = categoryName;
        this.products = products;
    }
}
