package lk.ijse.ecommerce.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.ViewCategoriesBO;
import lk.ijse.ecommerce.dto.CategoriesDTO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewCategoriesServlet", value = "/viewCategories")
public class ViewCategoriesServlet extends HttpServlet {

    ViewCategoriesBO viewCategoriesBO = (ViewCategoriesBO) BOFactory.getBO(BOFactory.Type.VIEWCATEGORIES);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<CategoriesDTO> allCategories = viewCategoriesBO.getAllCategories();

            req.setAttribute("categories", allCategories);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("pages/viewCategories.jsp");

            requestDispatcher.forward(req, resp);
        } catch (Exception e) {

        }
    }
}
