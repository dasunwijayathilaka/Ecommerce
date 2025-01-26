package lk.ijse.ecommerce.dto;

import lk.ijse.ecommerce.entity.Products;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CategoriesDTO {
    private int categoryId;
    private String categoryName;
    private List<Products> products;

    public CategoriesDTO(String categoryName, List<Products> products) {
        this.categoryName = categoryName;
        this.products = products;
    }
}
/*The `CategoriesDTO` class represents a category in the e-commerce system.
 It includes fields for `categoryId`, `categoryName`, and a list of `Products`.
  Lombok annotations generate constructors,
getters, setters, and `toString` methods, simplifying data handling.*/