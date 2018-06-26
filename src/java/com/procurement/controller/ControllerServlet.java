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
import com.procurement.bean.UserBean;
import com.procurement.dao.UserDao;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Josh Murunga
 */
public class ControllerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ControllerServlet() {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String source = request.getParameter("source");

        UserBean userBean = new UserBean();
        userBean.setUserName(username);
        userBean.setPassword(password);

        UserDao userDao = new UserDao();
        try {
            if (source.equals("login")) {

                String login = userDao.userLogin(userBean);

                if (login.equals("admin")) {

                    HttpSession session = request.getSession();
                    session.setAttribute("admin", username);
                    session.setMaxInactiveInterval(30 * 60);
                    Cookie userName = new Cookie("admin", username);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("admindash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("manager")) {

                    HttpSession session = request.getSession();
                    session.setAttribute("manager", username);
                    session.setMaxInactiveInterval(30 * 60);
                    Cookie userName = new Cookie("manager", username);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("mandash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("committee")) {

                    HttpSession session = request.getSession();
                    session.setAttribute("committee", username);
                    session.setMaxInactiveInterval(30 * 60);
                    Cookie userName = new Cookie("committee", username);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("comdash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("supplier")) {

                    HttpSession session = request.getSession();
                    session.setAttribute("supplier", username);
                    session.setMaxInactiveInterval(30 * 60);
                    Cookie userName = new Cookie("supplier", username);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("supdash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("userdpt")) {

                    HttpSession session = request.getSession();
                    session.setAttribute("userdpt", username);
                    session.setMaxInactiveInterval(30 * 60);
                    Cookie userName = new Cookie("userdpt", username);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("dptdash.jsp");
                    response.sendRedirect(encodedURL);

                } else {
                    
                    request.setAttribute("errMessage", login);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    
                }

            } else if (source.equals("register")) {

                String firstname = request.getParameter("firstname");
                String lastname = request.getParameter("lastname");
                String email = request.getParameter("email");
                String contact = request.getParameter("contact");
                String department = request.getParameter("department");
                String role = request.getParameter("role");

                userBean.setFirstName(firstname);
                userBean.setLastName(lastname);
                userBean.setEmail(email);
                userBean.setContact(contact);
                userBean.setDepartment(department);
                userBean.setRole(role);

                String register = userDao.userSignup(userBean);

                if (register.equals("usrnm")) {

                    request.setAttribute("errMessage", "Username Already In Use");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);

                } else if (register.equals("eml")) {

                    request.setAttribute("errMessage", "The email you entered is already registered");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);

                } else {

                    request.setAttribute("errMessage", "You have Signed Up successfully, Login");
                    request.getRequestDispatcher("login.jsp").forward(request, response);

                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
