package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;

import java.util.List;

public interface GetCategoriesNamesBO extends SuperBO {

    List<String> getCategoriesName() throws Exception;
}
