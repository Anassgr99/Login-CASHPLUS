package com.cashplus.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.cashplus.dao.UserDAO;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession(); // Get session
        
        // Check for empty fields
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            session.setAttribute("error", "Username or Password cannot be empty.");
            response.sendRedirect("index.jsp");
            return;
        }

        if (userDAO.validateUser(username, password)) {
            session.invalidate(); // Invalidate any existing session

            session = request.getSession(true); // Create new session
            session.setAttribute("username", username);
            session.setMaxInactiveInterval(30 * 60); // Set session timeout (30 min)

            response.sendRedirect("dashboard.jsp");
        } else {
            session.setAttribute("error", "Incorrect Username or Password."); // Store error msg
            response.sendRedirect("index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("index.jsp");
    }
}
