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
import com.procurement.bean.RequisitionBean;
import com.procurement.dao.UserDao;
import com.procurement.dao.RequisitionDao;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Josh Murunga
 */
@MultipartConfig(fileSizeThreshold=1024*1024*2, maxFileSize=1024*1024*10, maxRequestSize=1024*1024*50)
public class ControllerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "Requisitions";

    public ControllerServlet() {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String source = req.getParameter("source");

        UserBean userBean = new UserBean();
        userBean.setUserName(username);
        userBean.setPassword(password);

        UserDao userDao = new UserDao();
        try {
            if (source.equals("login")) {

                String login = userDao.userLogin(userBean);

                if (login.equals("manager")) {
                    
                    HttpSession session = req.getSession();
                    userBean.setRole("Manager");
                    session.setAttribute("LOGIN_USER", userBean.getRole());
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("LOGIN_USER", userBean.getUserName());
                    userName.setMaxAge(30*60);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("mandash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("committee")) {

                    HttpSession session = req.getSession();
                    userBean.setRole("CommitteeMemeber");
                    session.setAttribute("LOGIN_USER", userBean.getRole());
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("LOGIN_USER", userBean.getUserName());
                    userName.setMaxAge(30*60);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("comdash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("supplier")) {

                    HttpSession session = req.getSession();
                    userBean.setRole("Supplier");
                    session.setAttribute("LOGIN_USER", userBean.getRole());
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("LOGIN_USER", userBean.getUserName());
                    userName.setMaxAge(30*60);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("supdash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("userdpt")) {
                    
                    HttpSession session = req.getSession();
                    userBean.setRole("UserDepartment");
                    session.setAttribute("LOGIN_USER", userBean.getRole());
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("LOGIN_USER", userBean.getUserName());
                    userName.setMaxAge(30*60);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("dptdash.jsp");
                    response.sendRedirect(encodedURL);

                } else {
                    
                    req.setAttribute("errMessage", login);
                    req.getRequestDispatcher("login.jsp").forward(req, response);
                    
                }

            } else if (source.equals("register")) {

                String firstname = req.getParameter("firstname");
                String lastname = req.getParameter("lastname");
                String email = req.getParameter("email");
                String contact = req.getParameter("contact");
                String department = req.getParameter("department");
                String role = req.getParameter("role");

                userBean.setFirstName(firstname);
                userBean.setLastName(lastname);
                userBean.setEmail(email);
                userBean.setContact(contact);
                userBean.setDepartment(department);
                userBean.setRole(role);

                String register = userDao.userSignup(userBean);

                if (register.equals("usrnm")) {

                    req.setAttribute("errMessage", "Username Already In Use");
                    req.getRequestDispatcher("users.jsp").forward(req, response);

                } else if (register.equals("eml")) {

                    req.setAttribute("errMessage", "The email you entered is already registered");
                    req.getRequestDispatcher("users.jsp").forward(req, response);

                } else {

                    req.setAttribute("errMessage", "You have Signed Up successfully, Login");
                    req.getRequestDispatcher("users.jsp").forward(req, response);

                }
            } else if (source.equals("requisition")) {
                
                String item = req.getParameter("item");
                String category = req.getParameter("category");
                String units = req.getParameter("units");
                String unitprice = req.getParameter("unitprice");
                String quantity = req.getParameter("quantity");
                String totalprice = req.getParameter("totalprice");
                String supplier = req.getParameter("supplier");
                String userid = req.getParameter("userid");
                Part part = req.getPart("description");
                String filename = extractFileName(part);
                
                RequisitionBean requ = new RequisitionBean();
                
                requ.setItem(item);
                requ.setCategory(category);
                requ.setUnits(units);
                requ.setUnitPrice(unitprice);
                requ.setQuantity(quantity);
                requ.setTotalPrice(totalprice);
                requ.setSupplier(supplier);
                requ.setUserId(userid);
                
                
                RequisitionDao reqDao = new RequisitionDao();
                
                String store = reqDao.reqValidate(requ);
                String encodedURL = response.encodeRedirectURL("dptrequisitions.jsp");
                response.sendRedirect(encodedURL);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private String extractFileName(Part part) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
