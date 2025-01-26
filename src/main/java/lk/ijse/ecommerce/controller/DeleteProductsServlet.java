package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.DeleteProductsBO;
import lk.ijse.ecommerce.dto.ProductsDTO;
import lk.ijse.ecommerce.entity.Categories;

import java.io.IOException;

@WebServlet(name = "DeleteProductsServlet", value = "/deleteProducts")
public class DeleteProductsServlet extends HttpServlet {

    DeleteProductsBO deleteProductsBO = (DeleteProductsBO) BOFactory.getBO(BOFactory.Type.DELETEPRODUCTS);

    /*This servlet (`DeleteProductsServlet`) handles the deletion of products in an e-commerce application.
     It retrieves product details (ID, name, description, quantity, price, and category) from the HTTP request, creates a `ProductsDTO` object, and calls the business layer (`DeleteProductsBO`) to delete the product.
     After the operation, it redirects the user based on the outcome (success or failure).*/
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("search"));
        String productName = req.getParameter("productName");
        String description = req.getParameter("description");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        double price = Double.parseDouble(req.getParameter("price"));
        String categoryName = req.getParameter("categories");

        try {
            Categories categories = deleteProductsBO.getCategories(categoryName);
            ProductsDTO productsDTO = new ProductsDTO(productId,productName,description,quantity,price,categories);
            deleteProductsBO.deleteProduct(productsDTO);

            resp.sendRedirect("/E_Commerce_war_exploded/manageCustomers?message=");
        } catch (Exception e) {
            resp.sendRedirect("/E_Commerce_war_exploded/manageCustomers?message=Product Delete Unsuccessful !!");
        }
    }
}
