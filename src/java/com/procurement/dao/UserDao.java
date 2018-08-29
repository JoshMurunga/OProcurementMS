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
    String userid = null;
    String newpassword = null;

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

                if (authen.validatePassword(password, passwordDB) && roleDB.equals("Manager")) {
                    return "manager";
                } else if (authen.validatePassword(password, passwordDB) && roleDB.equals("CommitteeMember")) {
                    return "committee";
                } else if (authen.validatePassword(password, passwordDB) && roleDB.equals("Supplier")) {
                    return "supplier";
                } else if (authen.validatePassword(password, passwordDB) && roleDB.equals("UserDepartment")) {
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

    public String userUpdate(UserBean userBean, String myuserid) {
        String firstname = userBean.getFirstName();
        String lastname = userBean.getLastName();
        String email = userBean.getEmail();
        String username = userBean.getUserName();
        userid = myuserid;

        Connection conn = null;
        Statement statement = null;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            statement.executeUpdate("UPDATE users SET firstname='" + firstname + "', lastname='" + lastname + "', email='" + email + "', username='" + username + "' WHERE userid ='" + userid + "' ");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Failed To Register";
    }

    public String userNewPassword(UserBean userBean, String newpass, String myuserid) throws NoSuchAlgorithmException, InvalidKeySpecException {
        String password = userBean.getPassword();
        newpassword = authen.hash(newpass);
        userid = myuserid;

        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String passwordDB = null;
        String roleDB = null;
        int count = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM users WHERE userid='" + userid + "'");

            while (resultSet.next()) {
                passwordDB = resultSet.getString("password");
                roleDB = resultSet.getString("role");
                ++count;
            }

            if (count == 1) {

                if (authen.validatePassword(password, passwordDB)) {

                    statement.executeUpdate("UPDATE users SET password='" + newpassword + "' WHERE userid ='" + userid + "' ");

                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Failed To Register";
    }

    public String userResetPassword(String newpass, String myuserid) throws NoSuchAlgorithmException, InvalidKeySpecException {

        newpassword = authen.hash(newpass);
        userid = myuserid;

        Connection conn = null;
        Statement statement = null;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            statement.executeQuery("UPDATE users SET password='" + newpassword + "' WHERE userid ='" + userid + "' ");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Failed To Register";
    }

    public String userEditDetails(UserBean userBean, String myuserid) {
        String firstname = userBean.getFirstName();
        String lastname = userBean.getLastName();
        String email = userBean.getEmail();
        String username = userBean.getUserName();
        String contact = userBean.getContact();
        String department = userBean.getDepartment();
        String role = userBean.getRole();
        userid = myuserid;

        Connection conn = null;
        Statement statement = null;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            statement.executeQuery("UPDATE users SET firstname='" + firstname + "', lastname='" + lastname + "', email='" + email + "', username='" + username + "', contact='" + contact + "', department='" + department + "', role='" + role + "' WHERE userid='" + userid + "'");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Failed To Register";
    }

    public String userDelete(String myuserid) {
        userid = myuserid;

        Connection conn = null;
        Statement statement = null;
        int ex = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            ex = statement.executeUpdate("DELETE FROM users WHERE userid='" + userid + "'");

            if (ex > 0) {
                return "user was removed successfully";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Something went wrong, please try again";
    }
}
