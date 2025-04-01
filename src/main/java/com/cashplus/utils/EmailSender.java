package com.cashplus.utils;

import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailSender {

    private static final String SMTP_HOST = "smtp.gmail.com"; // Change if using another SMTP server
    private static final String SMTP_PORT = "587";
    private static final String SENDER_EMAIL = "anass.elgaradi@um5r.ac.ma";  // Your email
    private static final String SENDER_PASSWORD = "qtrf spxv hpcv xudl";  // App password (not your real password)

    public static void sendEmail(String recipientEmail, String subject, String messageContent) throws MessagingException {
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", SMTP_HOST);
        properties.put("mail.smtp.port", SMTP_PORT);

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(SENDER_EMAIL));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        message.setSubject(subject);
        message.setText(messageContent);

        Transport.send(message);
    }
}
