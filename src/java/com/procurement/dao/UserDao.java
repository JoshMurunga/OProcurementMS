/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.procurement.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.util.database.DBConnection;
import com.procurement.bean.UserBean;
import com.procurement.controller.AuthenticationServlet;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

public class UserDao {
    AuthenticationServlet authen = new AuthenticationServlet();

    public String userLogin(UserBean userBean) throws NoSuchAlgorithmException, InvalidKeySpecException {
        String username = userBean.getUserName();
        String password = userBean.getPassword();
        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String passwordDB = null;
        String roleDB = null;
        int count = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM users WHERE username='" + username + "'");

            while (resultSet.next()) {
                passwordDB = resultSet.getString("password");
                roleDB = resultSet.getString("role");
                ++count;
            }

            if (count == 1) {

                if (authen.validatePassword(password, passwordDB) && roleDB.equals("0")) {
                    return "admin";
                } else if (authen.validatePassword(password, passwordDB) && roleDB.equals("1")) {
                    return "manager";
                } else if (authen.validatePassword(password, passwordDB) && roleDB.equals("2")) {
                    return "committee";
                } else if (authen.validatePassword(password, passwordDB) && roleDB.equals("3")) {
                    return "supplier";
                } else if (authen.validatePassword(password, passwordDB) && roleDB.equals("4")) {
                    return "userdpt";
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Invalid User Credentials";
    }

    public String userSignup(UserBean userBean) throws NoSuchAlgorithmException, InvalidKeySpecException {
        String firstname = userBean.getFirstName();
        String lastname = userBean.getLastName();
        String email = userBean.getEmail();
        String username = userBean.getUserName();
        String password = authen.hash(userBean.getPassword());
        String contact = userBean.getContact();
        String department = userBean.getDepartment();
        String role = userBean.getRole();
        
        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        int count = 0;
        String usernameDB = null;
        String emailDB = null;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            resultSet = statement.executeQuery("SELECT * FROM users WHERE username='" + username + "' OR email='" + email + "'");

            while (resultSet.next()) {
                usernameDB = resultSet.getString("username");
                emailDB = resultSet.getString("email");
                ++count;
            }

            if (count > 0) {
                if (usernameDB.equals(username)) {
                    return "usrnm";
                } else if (emailDB.equals(email)) {
                    return "eml";
                }
            } else {

                statement.executeUpdate("INSERT INTO users (firstname,lastname,username,email,password,contact,department,role)"
                        + " VALUES ('" + firstname + "','" + lastname + "','" + username + "','" + email + "','" + password + "','" + contact + "','" + department + "','" + role + "')");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Failed To Register";
    }
}
