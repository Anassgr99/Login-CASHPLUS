package com.cashplus.utils;

import jakarta.mail.MessagingException;

public class TestEmail {
    public static void main(String[] args) {
        try {
            EmailSender.sendEmail("anasselgaradi@gmail.com", "Test Email", "This is a test email from Java.");
            System.out.println("✅ Email sent successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
