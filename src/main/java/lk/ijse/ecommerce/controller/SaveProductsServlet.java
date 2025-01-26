package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.SaveProductsBO;
import lk.ijse.ecommerce.dto.CategoriesDTO;
import lk.ijse.ecommerce.dto.ProductsDTO;
import lk.ijse.ecommerce.entity.Categories;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

@WebServlet(name = "SaveProductsServlet", value = "/saveProducts")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB: Threshold after which the file is written to disk
        maxFileSize = 1024 * 1024 * 10,      // 10MB: Maximum file size for a single file
        maxRequestSize = 1024 * 1024 * 50    // 50MB: Maximum size of the request
)
public class SaveProductsServlet extends HttpServlet {

    SaveProductsBO saveProductsBO = (SaveProductsBO) BOFactory.getBO(BOFactory.Type.SAVEPRODUCTS);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Ensure multipart/form-data is handled
        String name = req.getParameter("productName");
        String description = req.getParameter("description");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        double price = Double.parseDouble(req.getParameter("price"));
        String category = req.getParameter("categories");

        // Handle file upload
        Part filePart = req.getPart("imageFile");
        String fileName = filePart.getSubmittedFileName();

        // Define directory to save images
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Create directory if it doesn't exist
        }

        // Save the file to the uploads directory
        String filePath = uploadPath + File.separator + fileName;
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
        }

        try {
            // Save product details along with file path in DTO
            CategoriesDTO categoriesDTO = saveProductsBO.getCategories(category);
            Categories categories = new Categories(categoriesDTO.getCategoryId(), categoriesDTO.getCategoryName(), categoriesDTO.getProducts());

            // Store file path in database (not as byte array)
            ProductsDTO productsDTO = new ProductsDTO(
                    name,
                    description,
                    quantity,
                    price,
                    filePath,  // Save file path instead of byte array
                    categories,
                    new ArrayList<>()
            );

            saveProductsBO.saveProducts(productsDTO);

            resp.sendRedirect("/E_Commerce_war_exploded/manageCustomers?message=");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("/E_Commerce_war_exploded/pages/manageCustomers?message=Product Save Unsuccessfully");
        }
    }
}
