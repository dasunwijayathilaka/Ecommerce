package lk.ijse.ecommerce.bo;

import lk.ijse.ecommerce.bo.custom.impl.*;

public class BOFactory {

    public enum Type {
        SIGNUP, LOGIN, ADMIN, SAVEPRODUCTS, SEARCHPRODUCTS, UPDATEPRODUCTS, DELETEPRODUCTS, VIEWPRODUCTS, SAVECATEGORIES, SEARCHCATEGORIES, UPDATECATEGORIES, DELETECATEGORIES, VIEWCATEGORIES, MANAGECUSTOMER, VIEWORDERS, GETCATEGORIESNAMES,
        Index, ADDTOCART, BUYNOW, CART, MYPROFILE
    }

    public static SuperBO getBO(Type type) {
        return switch (type) {
            case SIGNUP -> new SignUpBOImpl();
            case LOGIN -> new LoginBOImpl();
            case ADMIN -> new AdminBOImpl();
            case SAVEPRODUCTS -> new SaveProductsBOImpl();
            case SEARCHPRODUCTS -> new SearchProductsBOImpl();
            case UPDATEPRODUCTS -> new UpdateProductsBOImpl();
            case DELETEPRODUCTS -> new DeleteProductsBOImpl();
            case VIEWPRODUCTS -> new ViewProductsBOImpl();
            case SAVECATEGORIES -> new SaveCategoriesBOImpl();
            case SEARCHCATEGORIES -> new SearchCategoriesBOImpl();
            case UPDATECATEGORIES -> new UpdateCategoriesBOImpl();
            case DELETECATEGORIES -> new DeleteCategoriesBOImpl();
            case VIEWCATEGORIES -> new ViewCategoriesBOImpl();
            case MANAGECUSTOMER -> new ManageCustomerBOImpl();
            case VIEWORDERS -> new ViewOrdersBOImpl();
            case GETCATEGORIESNAMES -> new GetCategoriesNamesBOImpl();
            case Index -> new IndexBOImpl();
            case ADDTOCART -> new AddToCartBOImpl();
            case BUYNOW -> new BuyNowBOImpl();
            case CART -> new CartBOImpl();
            case MYPROFILE -> new MyProfileBOImpl();
            default -> throw new IllegalArgumentException("Invalid BO Type");
        };
    }
}
