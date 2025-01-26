package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.SearchCategoriesBO;
import lk.ijse.ecommerce.dto.CategoriesDTO;
import lk.ijse.ecommerce.dto.ProductsDTO;

import javax.json.Json;
import javax.json.JsonObjectBuilder;
import java.io.IOException;

@WebServlet(urlPatterns = "/searchCategories")
public class SearchCategoriesServlet extends HttpServlet {

    SearchCategoriesBO searchCategoriesBO = (SearchCategoriesBO) BOFactory.getBO(BOFactory.Type.SEARCHCATEGORIES);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if (action.equals("id")){
                int categoryId = Integer.parseInt(req.getParameter("categoryId"));
                CategoriesDTO categoriesDTO = searchCategoriesBO.searchCategory(categoryId);

                if (categoriesDTO != null) {
                    JsonObjectBuilder objectBuilder = Json.createObjectBuilder();
                    objectBuilder.add("categoryId", categoriesDTO.getCategoryId())
                            .add("categoryName", categoriesDTO.getCategoryName());

                    resp.setContentType("application/json");
                    resp.getWriter().write(objectBuilder.build().toString());
                } else {
                    resp.getWriter().write("INVALID ID");
                }
            }
        } catch (Exception e) {
            resp.getWriter().write(e.getMessage());
        }
    }
}
