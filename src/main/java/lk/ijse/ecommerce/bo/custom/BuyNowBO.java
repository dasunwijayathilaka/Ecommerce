package lk.ijse.ecommerce.bo.custom;

import lk.ijse.ecommerce.bo.SuperBO;

public interface BuyNowBO extends SuperBO {

    void saveOrder(int productId,int quantity,double total) throws Exception;
}
