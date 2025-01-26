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
