package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.UpdateProductsBO;
import lk.ijse.ecommerce.dto.ProductsDTO;
import lk.ijse.ecommerce.entity.Categories;

import java.io.IOException;

@WebServlet(name = "UpdateProductsServlet", value = "/updateProducts")
public class UpdateProductsServlet extends HttpServlet {

    UpdateProductsBO updateProductsBO = (UpdateProductsBO) BOFactory.getBO(BOFactory.Type.UPDATEPRODUCTS);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("search"));
        String productName = req.getParameter("productName");
        String description = req.getParameter("description");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        double price = Double.parseDouble(req.getParameter("price"));
        String categoryName = req.getParameter("categories");

        try {
            Categories categories = updateProductsBO.getCategories(categoryName);
            ProductsDTO productsDTO = new ProductsDTO(productId,productName,description,quantity,price,categories);
            updateProductsBO.updateProduct(productsDTO);

            resp.sendRedirect("/E_Commerce_war_exploded/manageCustomers?message=");
        } catch (Exception e) {
            resp.sendRedirect("/E_Commerce_war_exploded/manageCustomers?message=Product Update Unsuccessful !!");
        }
    }
}
