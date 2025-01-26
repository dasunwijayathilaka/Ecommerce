package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.DeleteCategoriesBO;
import lk.ijse.ecommerce.dto.CategoriesDTO;

import java.io.IOException;

@WebServlet(name = "DeleteCategoriesServlet", value = "/deleteCategories")
public class DeleteCategoriesServlet extends HttpServlet {

    DeleteCategoriesBO deleteCategoriesBO = (DeleteCategoriesBO) BOFactory.getBO(BOFactory.Type.DELETECATEGORIES);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("search"));
        String categoryName = req.getParameter("categoryName");

        try {
            CategoriesDTO categories = deleteCategoriesBO.getCategories(categoryId);
            CategoriesDTO categoriesDTO = new CategoriesDTO(categoryId, categoryName, categories.getProducts());
            deleteCategoriesBO.deleteCategories(categoriesDTO);

            resp.sendRedirect("/E_Commerce_war_exploded/manageCustomers?message=");
        } catch (Exception e) {
            resp.sendRedirect("/E_Commerce_war_exploded/manageCustomers?message=Category Delete Unsuccessful !!");
        }
    }
}
