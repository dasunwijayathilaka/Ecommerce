package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.SearchProductsBO;
import lk.ijse.ecommerce.dto.ProductsDTO;

import javax.json.Json;
import javax.json.JsonObjectBuilder;
import java.io.IOException;

@WebServlet(urlPatterns = "/searchProducts")
public class SearchProductsServlet extends HttpServlet {

    SearchProductsBO searchProductsBO = (SearchProductsBO) BOFactory.getBO(BOFactory.Type.SEARCHPRODUCTS);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if (action.equals("id")){
                int productsId = Integer.parseInt(req.getParameter("productsId"));
                ProductsDTO productsDTO = searchProductsBO.searchProducts(productsId);

                if (productsDTO != null) {
                    JsonObjectBuilder objectBuilder = Json.createObjectBuilder();
                    objectBuilder.add("productId", productsDTO.getProductId())
                            .add("productName", productsDTO.getProductName())
                            .add("description", productsDTO.getDescription())
                            .add("quantity", productsDTO.getQuantity())
                            .add("price", productsDTO.getPrice())
                            .add("image", productsDTO.getImage())
                            .add("categories", productsDTO.getCategories().getCategoryName());
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
