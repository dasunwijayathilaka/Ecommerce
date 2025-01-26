package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.UpdateCategoriesBO;
import lk.ijse.ecommerce.dto.CategoriesDTO;

import java.io.IOException;

@WebServlet(name = "UpdateCategoriesServlet", value = "/updateCategories")
public class UpdateCategoriesServlet extends HttpServlet {

    UpdateCategoriesBO updateCategoriesBO = (UpdateCategoriesBO) BOFactory.getBO(BOFactory.Type.UPDATECATEGORIES);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("search"));
        String categoryName = req.getParameter("categoryName");

        try {
            CategoriesDTO categories = updateCategoriesBO.getCategories(categoryId);
            CategoriesDTO categoriesDTO = new CategoriesDTO(categoryId, categoryName, categories.getProducts());
            updateCategoriesBO.updateCategories(categoriesDTO);

            resp.sendRedirect("/E_Commerce_war_exploded/manageCustomers?message=");
        } catch (Exception e) {
            resp.sendRedirect("/E_Commerce_war_exploded/manageCustomers?message=Category Update Unsuccessful !!");
        }
    }
}
