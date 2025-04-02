package com.cashplus.dao;

import com.cashplus.config.DatabaseConnection;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


	import jakarta.mail.*;
	import jakarta.mail.internet.*;

	import java.util.Properties;

	public class UserDAO {

	    // 🔒 Method to register a new user with a hashed password and send email after registration
	    public boolean registerUser(String username, String password, String email) {
	        String sql = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
	        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt()); // Hash password

	        try (Connection conn = DatabaseConnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {

	            stmt.setString(1, username);
	            stmt.setString(2, hashedPassword);
	            stmt.setString(3, email);
	            int rowsInserted = stmt.executeUpdate();

	            if (rowsInserted > 0) {
	                // Send welcome email
	                sendEmail(email, "Welcome to CashPlus!", "Dear " + username + ",\n\nThank you for registering with CashPlus. Your account is now active.");
	                return true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

	    // Email utility method to send email
	    private void sendEmail(String toEmail, String subject, String messageBody) {
	        String host = "smtp.gmail.com";
	        String fromEmail = "your-email@gmail.com"; // Your email
	        String password = "your-email-password"; // Your email password

	        Properties properties = System.getProperties();
	        properties.put("mail.smtp.host", host);
	        properties.put("mail.smtp.port", "587");
	        properties.put("mail.smtp.auth", "true");
	        properties.put("mail.smtp.starttls.enable", "true");

	        Session session = Session.getInstance(properties, new jakarta.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(fromEmail, password);
	            }
	        });

	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(fromEmail));
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
	            message.setSubject(subject);
	            message.setText(messageBody);

	            Transport.send(message);
	            System.out.println("Email sent successfully.");
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }
	    }
	

    // Method to validate login using hashed password
    public boolean validateUser(String username, String password) {
        String sql = "SELECT password FROM users WHERE username = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                return BCrypt.checkpw(password, hashedPassword); // Verify password
            }

        } catch (SQLException e) {
            // Print error to console
            System.out.println("Error validating user: " + username);
            e.printStackTrace();
        }
        return false;
    }

    public boolean isEmailRegistered(String email) {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0; // Return true if email exists
            }

        } catch (SQLException e) {
            // Print error to console
            System.out.println("Error checking email: " + email);
            e.printStackTrace();
        }
        return false;
    }

    public void updatePassword(String email, String newPassword) {
        String sql = "UPDATE users SET password = ? WHERE email = ?";
        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, hashedPassword);
            stmt.setString(2, email);
            stmt.executeUpdate();

        } catch (SQLException e) {
            // Print error to console
            System.out.println("Error updating password for email: " + email);
            e.printStackTrace();
        }
    }
}
