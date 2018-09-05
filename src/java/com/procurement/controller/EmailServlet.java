/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.procurement.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.util.database.DBConnection;
import java.util.Random;
/**
 *
 * @author Josh Murunga
 */
public class EmailServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        String username = null;
        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        int count = 0;
        int ex = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM users WHERE email='" + email + "'");

            while (resultSet.next()) {
                username = resultSet.getString("username");
                ++count;
            }

            if (count == 1) {

                String token = getSaltString();
                String url = "http://127.0.0.1:8080/OProcurementMS/passreset.jsp?token=" + token + "&email=" + email;

                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");

                Session session = Session.getInstance(props,
                        new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("zalegointerview@gmail.com", "zalego1234");
                    }
                });

                try {

                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress("from@no-spam.com"));
                    message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                    message.setSubject("Password Resetting Link");
                    message.setText("Dear " + username + ","
                            + "\n\n Please use the following link below to be able to reset your password. The link will expire in 1 hour: "
                            + "\n\n" + url);

                    Transport.send(message);

                    ex = statement.executeUpdate("INSERT INTO passwordreset (email,token,timestamp) VALUES ('" + email + "','" + token + "',now()::timestamp(0))");

                    if (ex > 0) {
                        request.setAttribute("errMessage", "Please check your email for your password reset link");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        request.setAttribute("errMessage", "Somethingwent wrong, please try again");
                        request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
                    }

                } catch (MessagingException e) {
                    request.setAttribute("errMessage", "Connection Timed Out, Please Try Again");
                    request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("errMessage", "The Email you have entered does not exist in the system");
                request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected String getSaltString() {
        String SALTCHARS = "QWERTYUIOPASDFGHJKLZXCVBNMmnbvcxzlkjhgfdsapoiuytrewq1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 21) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
}
