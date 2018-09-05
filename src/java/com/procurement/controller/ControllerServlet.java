/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.procurement.controller;

import com.procurement.bean.BidBean;
import com.procurement.bean.CommitteeBean;
import com.procurement.bean.CompanyBean;
import com.procurement.bean.EvaluationBean;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.procurement.bean.UserBean;
import com.procurement.bean.RequisitionBean;
import com.procurement.bean.TenderBean;
import com.procurement.dao.BidDao;
import com.procurement.dao.CommitteeDao;
import com.procurement.dao.CompanyDao;
import com.procurement.dao.EvaluationDao;
import com.procurement.dao.UserDao;
import com.procurement.dao.RequisitionDao;
import com.procurement.dao.TenderDao;
import java.io.File;
import java.text.DecimalFormat;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Josh Murunga
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class ControllerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String REQ_DIR = "Requisitions";
    private static final String TEN_DIR = "Tenders";
    private static final String BID_DIR = "BidDocs";
    private static final String COM_DIR = "CompanyDocs";

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
                    session.setMaxInactiveInterval(30 * 60);
                    Cookie userName = new Cookie("LOGIN_USER", userBean.getUserName());
                    userName.setMaxAge(60 * 60 * 24);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("mandash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("committee")) {

                    HttpSession session = req.getSession();
                    userBean.setRole("CommitteeMember");
                    session.setAttribute("LOGIN_USER", userBean.getRole());
                    session.setMaxInactiveInterval(30 * 60);
                    Cookie userName = new Cookie("LOGIN_USER", userBean.getUserName());
                    userName.setMaxAge(60 * 60 * 24);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("comdash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("supplier")) {

                    HttpSession session = req.getSession();
                    userBean.setRole("Supplier");
                    session.setAttribute("LOGIN_USER", userBean.getRole());
                    session.setMaxInactiveInterval(30 * 60);
                    Cookie userName = new Cookie("LOGIN_USER", userBean.getUserName());
                    userName.setMaxAge(60 * 60 * 24);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("supdash.jsp");
                    response.sendRedirect(encodedURL);

                } else if (login.equals("userdpt")) {

                    HttpSession session = req.getSession();
                    userBean.setRole("UserDepartment");
                    session.setAttribute("LOGIN_USER", userBean.getRole());
                    session.setMaxInactiveInterval(30 * 60);
                    Cookie userName = new Cookie("LOGIN_USER", userBean.getUserName());
                    userName.setMaxAge(60 * 60 * 24);
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

            } else if (source.equals("editUserDetails")) {

                String firstname = req.getParameter("firstname");
                String lastname = req.getParameter("lastname");
                String email = req.getParameter("email");
                String contact = req.getParameter("contact");
                String department = req.getParameter("department");
                String role = req.getParameter("role");
                String userid = req.getParameter("userid");

                userBean.setFirstName(firstname);
                userBean.setLastName(lastname);
                userBean.setEmail(email);
                userBean.setContact(contact);
                userBean.setDepartment(department);
                userBean.setRole(role);

                String register = userDao.userEditDetails(userBean, userid);

                req.setAttribute("errMessage", register);
                req.getRequestDispatcher("users.jsp").forward(req, response);

            } else if (source.equals("update")) {

                String firstname = req.getParameter("firstname");
                String lastname = req.getParameter("lastname");
                String email = req.getParameter("email");
                String contact = req.getParameter("contact");
                String userid = req.getParameter("userid");

                userBean.setFirstName(firstname);
                userBean.setLastName(lastname);
                userBean.setEmail(email);
                userBean.setContact(contact);

                String register = userDao.userUpdate(userBean, userid);

                Cookie userName = new Cookie("LOGIN_USER", userBean.getUserName());
                userName.setMaxAge(60 * 60 * 24);
                response.addCookie(userName);
                String encodedURL = response.encodeRedirectURL("profile.jsp?errMessage="+register);
                response.sendRedirect(encodedURL);

            } else if (source.equals("changepass")) {

                String newpassword = req.getParameter("newpassword");
                String userid = req.getParameter("userid");

                String register = userDao.userNewPassword(userBean, newpassword, userid);

                req.setAttribute("errMessage", register);
                req.getRequestDispatcher("profile.jsp").forward(req, response);

            } else if (source.equals("resetpass")) {

                String newpassword = req.getParameter("newpassword");
                String userid = req.getParameter("userid");

                String register = userDao.userResetPassword(newpassword, userid);

                req.setAttribute("errMessage", register);
                req.getRequestDispatcher("login.jsp").forward(req, response);

            } else if (source.equals("supregister")) {

                String firstname = req.getParameter("firstname");
                String lastname = req.getParameter("lastname");
                String email = req.getParameter("email");
                String contact = req.getParameter("contact");
                String department = req.getParameter("supplierdepartment");
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
                String userid = req.getParameter("hiddenid");
                System.out.println(userid);

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
                requ.setUserId(userid);
                requ.setDescription(description);

                RequisitionDao reqDao = new RequisitionDao();

                String store = reqDao.reqValidate(requ);

                req.setAttribute("errMessage", store);
                req.getRequestDispatcher("dptrequisitions.jsp").forward(req, response);

            } else if (source.equals("editrequisition")) {

                String item = req.getParameter("item");
                String category = req.getParameter("category");
                String units = req.getParameter("units");
                String unitprice = req.getParameter("unitprice");
                String quantity = req.getParameter("quantity");
                String totalprice = req.getParameter("totalprice");
                String requisitionid = req.getParameter("requisitionid");

                String savePath = "E:\\PROGRAMMING\\NetBeansProjects\\OProcurementMS\\web\\WEB-INF" + File.separator + REQ_DIR;
                File fileSaveDir = new File(savePath);
                Part part = req.getPart("eddescription");
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
                requ.setDescription(description);

                RequisitionDao reqDao = new RequisitionDao();

                String store = reqDao.reqEdit(requ, requisitionid);

                req.setAttribute("errMessage", store);
                req.getRequestDispatcher("dptrequisitions.jsp").forward(req, response);

            } else if (source.equals("tenders")) {

                String title = req.getParameter("title");
                String category = req.getParameter("category");
                String opendate = req.getParameter("opendate");
                String closingdate = req.getParameter("closingdate");
                String description = req.getParameter("description");
                String status = req.getParameter("status");

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
                ten.setStatus(status);

                TenderDao tenDao = new TenderDao();

                String newTender = tenDao.addTender(ten);

                req.setAttribute("errMessage", newTender);
                req.getRequestDispatcher("tenders.jsp").forward(req, response);

            } else if (source.equals("edittenders")) {

                String title = req.getParameter("title");
                String category = req.getParameter("category");
                String opendate = req.getParameter("opendate");
                String closingdate = req.getParameter("closingdate");
                String description = req.getParameter("description");
                String status = req.getParameter("status");
                String tenderid = req.getParameter("tenderid");

                String savePath = "E:\\PROGRAMMING\\NetBeansProjects\\OProcurementMS\\web\\WEB-INF" + File.separator + TEN_DIR;
                File fileSaveDir = new File(savePath);
                Part part = req.getPart("edittenderdocs");
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
                ten.setStatus(status);

                TenderDao tenDao = new TenderDao();

                String newTender = tenDao.editTender(ten, tenderid);

                req.setAttribute("errMessage", newTender);
                req.getRequestDispatcher("tenders.jsp").forward(req, response);

            } else if (source.equals("company")) {

                String companyname = req.getParameter("companyname");
                String email = req.getParameter("email");
                String contact = req.getParameter("contact");
                String location = req.getParameter("location");
                String address = req.getParameter("address");
                String userid = req.getParameter("userid");

                String savePath = "E:\\PROGRAMMING\\NetBeansProjects\\OProcurementMS\\web\\WEB-INF" + File.separator + COM_DIR;
                File fileSaveDir = new File(savePath);

                Part partPin = req.getPart("pincertificate");
                String filePin = extractFileName(partPin);
                partPin.write(savePath + File.separator + filePin);
                String pincertificate = savePath + File.separator + filePin;

                CompanyBean com = new CompanyBean();

                com.setCompanyName(companyname);
                com.setEmail(email);
                com.setContact(contact);
                com.setLocation(location);
                com.setAddress(address);
                com.setUserId(userid);
                com.setPinCertificate(pincertificate);

                CompanyDao comDao = new CompanyDao();

                String newCom = comDao.addCompany(com);

                req.setAttribute("errMessage", newCom);
                req.getRequestDispatcher("supdash.jsp").forward(req, response);

            } else if (source.equals("bids")) {

                String tenderid = req.getParameter("tenderid");
                String companyid = req.getParameter("companyid");
                String bidprice = req.getParameter("bidprice");

                String savePath = "E:\\PROGRAMMING\\NetBeansProjects\\OProcurementMS\\web\\WEB-INF" + File.separator + BID_DIR;
                File fileSaveDir = new File(savePath);

                Part partTax = req.getPart("taxcompliance");
                String fileTax = extractFileName(partTax);
                partTax.write(savePath + File.separator + fileTax);
                String taxcompliance = savePath + File.separator + fileTax;

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
                bid.setFinancialHistory(financialhistory);
                bid.setTechSpecs(techspecs);
                bid.setBidPrice(bidprice);
                bid.setCompanyId(companyid);
                bid.setTenderId(tenderid);

                BidDao bidDao = new BidDao();

                String newBid = bidDao.addBid(bid);

                req.setAttribute("errMessage", newBid);
                req.getRequestDispatcher("supdash.jsp").forward(req, response);

            } else if (source.equals("addmember")) {

                String tenderid = req.getParameter("tenderid");
                String userid = req.getParameter("userid");
                String expertise = req.getParameter("expertise");

                CommitteeBean com = new CommitteeBean();

                com.setTenderId(tenderid);
                com.setUserId(userid);
                com.setExpertise(expertise);

                CommitteeDao comDao = new CommitteeDao();

                String newMember = comDao.addMember(com);

                req.setAttribute("errMessage", newMember);
                req.getRequestDispatcher("addevcomm.jsp").forward(req, response);

            } else if (source.equals("evaluation")) {

                double pincert = Double.parseDouble(req.getParameter("pincert"));
                double taxcomp = Double.parseDouble(req.getParameter("taxcomp"));
                double finhist = Double.parseDouble(req.getParameter("finhist"));
                double techspec = Double.parseDouble(req.getParameter("techspec"));
                double stage1 = pincert + taxcomp + finhist + techspec;

                double fineval = Double.parseDouble(req.getParameter("fineval"));
                double techeval = Double.parseDouble(req.getParameter("techeval"));
                double stage2 = fineval + techeval;

                double bidprice = Double.parseDouble(req.getParameter("bidprice"));
                double totalbidprice = Double.parseDouble(req.getParameter("totalbidprice"));
                double value = 100 - ((bidprice / totalbidprice) * 100);
                DecimalFormat round = new DecimalFormat("##.00");
                String stage3 = round.format(value);

                String bidid = req.getParameter("bidid");
                String committeeid = req.getParameter("hiddenid");
                String tenderid = req.getParameter("tenderid");

                EvaluationBean eval = new EvaluationBean();

                eval.setStage1(stage1);
                eval.setStage2(stage2);
                eval.setStage3(stage3);
                eval.setBidId(bidid);
                eval.setCommitteeId(committeeid);
                eval.setTenderId(tenderid);

                EvaluationDao evalDao = new EvaluationDao();

                String newEvaluation = evalDao.addEvaluation(eval);

                req.setAttribute("errMessage", newEvaluation);
                req.getRequestDispatcher("evaluation.jsp").forward(req, response);

            } else if (source.equals("publish")) {

                String tenderid = req.getParameter("tenderid");
                String companyid = req.getParameter("companyid");

                EvaluationDao evalDao = new EvaluationDao();

                String publish = evalDao.addPublication(tenderid, companyid);

                req.setAttribute("errMessage", publish);
                req.getRequestDispatcher("tenderbids.jsp").forward(req, response);

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
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response)
            throws ServletException, IOException {

        String source = req.getParameter("source");

        if (source.equals("deluser")) {

            String userid = req.getParameter("userid");

            UserDao userDao = new UserDao();
            String register = userDao.userDelete(userid);

            req.setAttribute("errMessage", register);
            req.getRequestDispatcher("users.jsp").forward(req, response);

        } else if (source.equals("deltender")) {

            String userid = req.getParameter("tenderid");

            TenderDao tenDao = new TenderDao();

            String remTender = tenDao.delTender(userid);

            req.setAttribute("errMessage", remTender);
            req.getRequestDispatcher("tenders.jsp").forward(req, response);

        } else if (source.equals("reqdel")) {

            String requisitionid = req.getParameter("id");

            RequisitionDao reqDao = new RequisitionDao();
            String requisition = reqDao.reqDelete(requisitionid);

            req.setAttribute("errMessage", requisition);
            req.getRequestDispatcher("dptrequisitions.jsp").forward(req, response);

        } else if (source.equals("reqapp")) {

            String requisitionid = req.getParameter("id");

            RequisitionDao reqDao = new RequisitionDao();
            String requisition = reqDao.reqApprove(requisitionid);

            req.setAttribute("errMessage", requisition);
            req.getRequestDispatcher("requisitions.jsp").forward(req, response);

        } else if (source.equals("reqdecl")) {

            String requisitionid = req.getParameter("id");

            RequisitionDao reqDao = new RequisitionDao();
            String requisition = reqDao.reqDecline(requisitionid);

            req.setAttribute("errMessage", requisition);
            req.getRequestDispatcher("dptrequisitions.jsp").forward(req, response);

        } else if (source.equals("accept")) {

            String awardid = req.getParameter("awardid");

            EvaluationDao evalDao = new EvaluationDao();

            String publish = evalDao.acceptAward(awardid);
            
            req.setAttribute("errMessage", publish);
            req.getRequestDispatcher("award.jsp").forward(req, response);

        } else if (source.equals("decline")) {

            String awardid = req.getParameter("awardid");

            EvaluationDao evalDao = new EvaluationDao();

            String publish = evalDao.declineAward(awardid);
            
            req.setAttribute("errMessage", publish);
            req.getRequestDispatcher("award.jsp").forward(req, response);

        }

    }
}
