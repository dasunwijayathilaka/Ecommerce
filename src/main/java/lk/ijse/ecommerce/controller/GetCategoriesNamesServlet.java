package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.GetCategoriesNamesBO;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/getCategoryNames")
public class GetCategoriesNamesServlet extends HttpServlet {

    GetCategoriesNamesBO getCategoriesNamesBO = (GetCategoriesNamesBO) BOFactory.getBO(BOFactory.Type.GETCATEGORIESNAMES);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            List<String> categoryNames = getCategoriesNamesBO.getCategoriesName();

            JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder(categoryNames);

            resp.setContentType("application/json");
            resp.getWriter().write(jsonArrayBuilder.build().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
/*This servlet (`GetCategoriesNamesServlet`) handles retrieving category names for an e-commerce application.
It calls the business layer (`GetCategoriesNamesBO`) to fetch the category names, then converts the result into a JSON array.
The response is sent back in JSON format, allowing the client-side to consume the data.*/