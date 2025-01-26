package lk.ijse.ecommerce.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.SignUpBO;
import lk.ijse.ecommerce.bo.custom.impl.LoginBOImpl;
import lk.ijse.ecommerce.dto.UsersDTO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SignUpServlet", value = "/signup")
public class SignUpServlet extends HttpServlet {

    SignUpBO signUpBO = (SignUpBO) BOFactory.getBO(BOFactory.Type.SIGNUP);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            UsersDTO usersDTO = new UsersDTO(req.getParameter("fullName"), req.getParameter("email"), Integer.parseInt(req.getParameter("mobile")), req.getParameter("username"), "Customer", req.getParameter("password"), new ArrayList<>());
            signUpBO.saveUsers(usersDTO);

            LoginServlet.username = usersDTO.getUserName();
            LoginServlet.password = usersDTO.getPassword();

            resp.sendRedirect("/E_Commerce_war_exploded/index.jsp?message=SignUp Successfully&checked=true&username=" + usersDTO.getUserName()); // redirect to login page or home page after successful registration
        } catch (Exception e) {
            e.printStackTrace(); // or use a logging framework like SLF4J
            resp.sendRedirect("/E_Commerce_war_exploded/index.jsp?message=SignUp Unsuccessfully");
        }

    }
}
