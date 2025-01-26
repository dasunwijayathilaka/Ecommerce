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
