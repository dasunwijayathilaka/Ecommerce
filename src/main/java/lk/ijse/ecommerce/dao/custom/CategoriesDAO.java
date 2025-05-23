package lk.ijse.ecommerce.dao.custom;

import lk.ijse.ecommerce.dao.SuperDAO;
import lk.ijse.ecommerce.entity.Categories;

import java.util.List;

public interface CategoriesDAO extends SuperDAO {

    Categories getCategories(String categoryName) throws Exception;
    void saveCategories(Categories categories) throws Exception;
    void updateCategories(Categories categories) throws Exception;
    void deleteCategories(Categories categories) throws Exception;
    List<Categories> getAllCategories() throws Exception;
    Categories getCategoryById(int categoryId) throws Exception;
    List<String> getCategoriesName() throws Exception;
}
/*The `CategoriesDAO` interface defines methods for category management,
 including retrieving, saving, updating, deleting categories, and fetching category names.
 It also provides methods to get all categories,
 retrieve a category by ID, and extend functionality from `SuperDAO`.*/