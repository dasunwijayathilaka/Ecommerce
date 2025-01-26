package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.SaveCategoriesBO;
import lk.ijse.ecommerce.dto.CategoriesDTO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SaveCategoriesServlet", value = "/saveCategories")
public class SaveCategoriesServlet extends HttpServlet {

    SaveCategoriesBO saveCategoriesBO = (SaveCategoriesBO) BOFactory.getBO(BOFactory.Type.SAVECATEGORIES);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("categoryName");

        try {
            CategoriesDTO categoriesDTO = new CategoriesDTO(categoryName,new ArrayList<>());
            saveCategoriesBO.saveCategory(categoriesDTO);

            resp.sendRedirect("/E_Commerce_war_exploded/manageCustomers?message=");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("/E_Commerce_war_exploded/pages/manageCustomers?message=Category Save Unsuccessfully");
        }
    }
}
