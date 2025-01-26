package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.AdminBO;

import java.io.IOException;

@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {

    AdminBO adminBO = (AdminBO) BOFactory.getBO(BOFactory.Type.ADMIN);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String username = req.getParameter("username");
            String password = req.getParameter("password");

            boolean checkedUser = adminBO.checkAdmin(username, password);

            if (checkedUser){
                resp.sendRedirect("/E_Commerce_war_exploded/manageCustomers?message=");
            } else {
                resp.sendRedirect("/E_Commerce_war_exploded/admin.jsp?message=Login Unsuccessfully");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("/E_Commerce_war_exploded/admin.jsp?message=Login Unsuccessfully");
        }
    }
}
