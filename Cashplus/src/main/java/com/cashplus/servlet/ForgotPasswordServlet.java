package com.cashplus.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cashplus.dao.UserDAO;
import com.cashplus.utils.EmailSender;

import java.io.IOException;
import java.util.UUID;
import jakarta.mail.MessagingException;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        HttpSession session = request.getSession();

        // Check if the email exists in the database
        if (userDAO.isEmailRegistered(email)) {
            // Generate a temporary password
            String tempPassword = UUID.randomUUID().toString().substring(0, 8);
            userDAO.updatePassword(email, tempPassword);

            // Send the temporary password via email
            String subject = "Cashplus Password Reset";
            String message = "Hello,\n\nYour new temporary password is: " + tempPassword + "\n\nPlease change it after logging in.";
            
            try {
                EmailSender.sendEmail(email, subject, message);
                session.setAttribute("message", "A password reset email has been sent.");
            } catch (MessagingException e) {
                session.setAttribute("error", "Failed to send email. Please try again.");
                e.printStackTrace();
            }
        } else {
            session.setAttribute("error", "Email not found. Please check and try again.");
        }

        response.sendRedirect("index.jsp");

    }
}
