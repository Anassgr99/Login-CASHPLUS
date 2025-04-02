package com.cashplus.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cashplus.dao.UserDAO;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // Call the DAO to register the user and send the email
        UserDAO userDAO = new UserDAO();
        boolean registrationSuccess = userDAO.registerUser(username, password, email);

        // Redirect to the appropriate page
        if (registrationSuccess) {
            // Redirect to a success page (or any other logic)
            response.sendRedirect("index.jsp");
        } else {
            // Redirect back to the registration form with an error message
            response.sendRedirect("signup.jsp?error=true");
        }
    }
}
