package lk.ijse.ecommerce.bo.custom.impl;

import lk.ijse.ecommerce.bo.custom.AddToCartBO;
import lk.ijse.ecommerce.dao.DAOFactory;
import lk.ijse.ecommerce.dao.custom.CartDAO;
import lk.ijse.ecommerce.dto.CartDTO;
import lk.ijse.ecommerce.entity.Cart;

public class AddToCartBOImpl implements AddToCartBO {

    CartDAO cartDAO = (CartDAO) DAOFactory.getDAO(DAOFactory.Type.CART);

    @Override
    public void saveToCart(CartDTO cartDTO) throws Exception {
        Cart cart = new Cart(cartDTO.getProductId(), cartDTO.getQuantity());
        cartDAO.save(cart);
    }
}
