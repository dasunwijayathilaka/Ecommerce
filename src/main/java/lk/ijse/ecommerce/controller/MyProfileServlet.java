package lk.ijse.ecommerce.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce.bo.BOFactory;
import lk.ijse.ecommerce.bo.custom.MyProfileBO;
import lk.ijse.ecommerce.dto.UsersDTO;

import java.io.IOException;

@WebServlet(name = "MyProfileServlet", value = "/myProfile")
public class MyProfileServlet extends HttpServlet {

    MyProfileBO myProfileBO = (MyProfileBO) BOFactory.getBO(BOFactory.Type.MYPROFILE);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UsersDTO users = myProfileBO.getUsers(LoginServlet.username, LoginServlet.password);

            req.setAttribute("user", users);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/myProfile.jsp");

            requestDispatcher.forward(req, resp);
        } catch (Exception e) {

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        int tel = Integer.parseInt(req.getParameter("tel"));
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");

        try {
            UsersDTO users = myProfileBO.getUsers(LoginServlet.username, LoginServlet.password);
            UsersDTO usersDTO = new UsersDTO(users.getUserId(),fullName, email, tel, userName, users.getType(), password, users.getOrders());
            myProfileBO.updateUsers(usersDTO);

            LoginServlet.username = userName;
            LoginServlet.password = password;

            resp.sendRedirect("/E_Commerce_war_exploded/index");
        } catch (Exception e) {
            resp.sendRedirect("/E_Commerce_war_exploded/index?message=User Details Update Unsuccessful!!");
        }
    }
}
