package com.cashplus.dao;

import com.cashplus.config.DatabaseConnection;

import org.mindrot.jbcrypt.BCrypt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    // 🔒 Method to register a new user with a hashed password
    public boolean registerUser(String username, String password) {
        String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt()); // Hash password

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, hashedPassword);
            int rowsInserted = stmt.executeUpdate();

            return rowsInserted > 0; // Return true if user added successfully

        } catch (SQLException e) {
            e.printStackTrace();
            return false;	
        }
    }

    // 🔑 Method to validate login using hashed password
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
            e.printStackTrace();
        }
    }

}
