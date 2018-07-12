/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.procurement.controller;

import com.procurement.bean.BidBean;
import com.procurement.bean.CompanyBean;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.procurement.bean.UserBean;
import com.procurement.bean.RequisitionBean;
import com.procurement.bean.TenderBean;
import com.procurement.dao.BidDao;
import com.procurement.dao.CompanyDao;
import com.procurement.dao.UserDao;
import com.procurement.dao.RequisitionDao;
import com.procurement.dao.TenderDao;
import java.io.File;
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
    private static final String REQ_DIR = "Requisitions";
    private static final String TEN_DIR = "Tenders";
    private static final String BID_DIR = "BidDocs";

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
                    userName.setMaxAge(60*60*24);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("mandash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("committee")) {

                    HttpSession session = req.getSession();
                    userBean.setRole("CommitteeMember");
                    session.setAttribute("LOGIN_USER", userBean.getRole());
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("LOGIN_USER", userBean.getUserName());
                    userName.setMaxAge(60*60*24);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("comdash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("supplier")) {

                    HttpSession session = req.getSession();
                    userBean.setRole("Supplier");
                    session.setAttribute("LOGIN_USER", userBean.getRole());
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("LOGIN_USER", userBean.getUserName());
                    userName.setMaxAge(60*60*24);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("supdash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("userdpt")) {
                    
                    HttpSession session = req.getSession();
                    userBean.setRole("UserDepartment");
                    session.setAttribute("LOGIN_USER", userBean.getRole());
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("LOGIN_USER", userBean.getUserName());
                    userName.setMaxAge(60*60*24);
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
                
            } else if (source.equals("supregister")) {

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
                    req.getRequestDispatcher("login.jsp").forward(req, response);

                } else if (register.equals("eml")) {

                    req.setAttribute("errMessage", "The email you entered is already registered");
                    req.getRequestDispatcher("login.jsp").forward(req, response);

                } else {

                    req.setAttribute("errMessage", "You have Signed Up successfully, Login");
                    req.getRequestDispatcher("login.jsp").forward(req, response);

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
                
                String savePath = "E:\\PROGRAMMING\\NetBeansProjects\\OProcurementMS\\web\\WEB-INF" + File.separator + REQ_DIR;
                File fileSaveDir = new File(savePath);
                Part part = req.getPart("description");
                String fileName = extractFileName(part);
                part.write(savePath + File.separator + fileName);
                String description = savePath + File.separator + fileName;
                
                RequisitionBean requ = new RequisitionBean();
                
                requ.setItem(item);
                requ.setCategory(category);
                requ.setUnits(units);
                requ.setUnitPrice(unitprice);
                requ.setQuantity(quantity);
                requ.setTotalPrice(totalprice);
                requ.setSupplier(supplier);
                requ.setUserId(userid);
                requ.setDescription(description);

                RequisitionDao reqDao = new RequisitionDao();
                
                String store = reqDao.reqValidate(requ);
                String encodedURL = response.encodeRedirectURL("dptrequisitions.jsp");
                response.sendRedirect(encodedURL);
                
            } else if(source.equals("tenders")){
                
                String title = req.getParameter("title");
                String category = req.getParameter("category");
                String opendate = req.getParameter("opendate");
                String closingdate = req.getParameter("closingdate");
                String description = req.getParameter("description");
                
                String savePath = "E:\\PROGRAMMING\\NetBeansProjects\\OProcurementMS\\web\\WEB-INF" + File.separator + TEN_DIR;
                File fileSaveDir = new File(savePath);
                Part part = req.getPart("tenderdocs");
                String fileName = extractFileName(part);
                part.write(savePath + File.separator + fileName);
                String tenderdocs = savePath + File.separator + fileName;
                
                TenderBean ten = new TenderBean();
                
                ten.setTitle(title);
                ten.setCategory(category);
                ten.setOpenDate(opendate);
                ten.setClosingDate(closingdate);
                ten.setDescription(description);
                ten.setTenderDocs(tenderdocs);
                
                TenderDao tenDao = new TenderDao();
                
                String newTender = tenDao.addTender(ten);
                String encodedURL = response.encodeRedirectURL("tenders.jsp");
                response.sendRedirect(encodedURL);
                
            } else if(source.equals("company")){
                
                String companyname = req.getParameter("companyname");
                String email = req.getParameter("email");
                String contact = req.getParameter("contact");
                String location = req.getParameter("location");
                String address = req.getParameter("address");
                String userid = req.getParameter("userid");
                
                CompanyBean com = new CompanyBean();
                
                com.setCompanyName(companyname);
                com.setEmail(email);
                com.setContact(contact);
                com.setLocation(location);
                com.setAddress(address);
                com.setUserId(userid);
                
                CompanyDao comDao = new CompanyDao();
                
                String newCom = comDao.addCompany(com);
                String encodedURL = response.encodeRedirectURL("supdash.jsp");
                response.sendRedirect(encodedURL);
                
            } else if(source.equals("bids")){
                
                String tenderid = req.getParameter("tenderid");
                String companyid = req.getParameter("companyid");
                String bidprice = req.getParameter("bidprice");
 
                String savePath = "E:\\PROGRAMMING\\NetBeansProjects\\OProcurementMS\\web\\WEB-INF" + File.separator + BID_DIR;
                File fileSaveDir = new File(savePath);
                
                Part partTax = req.getPart("taxcompliance");
                String fileTax = extractFileName(partTax);
                partTax.write(savePath + File.separator + fileTax);
                String taxcompliance = savePath + File.separator + fileTax;
                
                Part partPin = req.getPart("pincertificate");
                String filePin = extractFileName(partPin);
                partPin.write(savePath + File.separator + filePin);
                String pincertificate = savePath + File.separator + filePin;
                
                Part partFin = req.getPart("financialhistory");
                String fileFin = extractFileName(partFin);
                partFin.write(savePath + File.separator + fileFin);
                String financialhistory = savePath + File.separator + fileFin;
                
                Part partTech = req.getPart("techspecs");
                String fileTech = extractFileName(partTech);
                partTech.write(savePath + File.separator + fileTech);
                String techspecs = savePath + File.separator + fileTech;
                
                BidBean bid = new BidBean();
                bid.setTaxCompliance(taxcompliance);
                bid.setPinCertificate(pincertificate);
                bid.setFinancialHistory(financialhistory);
                bid.setTechSpecs(techspecs);
                bid.setBidPrice(bidprice);
                bid.setCompanyId(companyid);
                bid.setTenderId(tenderid);
                
                BidDao bidDao = new BidDao();
                
                String newBid = bidDao.addBid(bid);
                String encodedURL = response.encodeRedirectURL("supdash.jsp");
                response.sendRedirect(encodedURL);
                
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items){
            if(s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }

}
