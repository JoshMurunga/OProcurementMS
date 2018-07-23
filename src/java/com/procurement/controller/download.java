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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.File;
import com.util.database.DBConnection;
import java.io.FileInputStream;
import java.io.OutputStream;

/**
 *
 * @author Josh Murunga
 */
public class download extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String source = request.getParameter("source");
        String source2 = request.getParameter("source2");
        String id = request.getParameter("id");
        String path = null;
        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try {
            if (source.equals("requisition")) {

                conn = DBConnection.createConnection();
                statement = conn.createStatement();
                resultSet = statement.executeQuery("SELECT description FROM requisitions WHERE requisitionid='" + id + "'");

                while (resultSet.next()) {
                    path = resultSet.getString("description");
                    ++count;
                }

                if (count == 1) {

                    File my_file = new File(path);
                    String fileName = my_file.getName();
                    String headerKey = "Content-Disposition";
                    String headerValue = String.format("attachment; filename=\"%s\"", fileName);
                    response.setHeader(headerKey, headerValue);

                    OutputStream out = response.getOutputStream();
                    FileInputStream in = new FileInputStream(my_file);
                    byte[] buffer = new byte[4096];
                    int length;
                    while ((length = in.read(buffer)) > 0) {
                        out.write(buffer, 0, length);
                    }
                    in.close();
                    out.flush();

                }

            } else if (source.equals("tender")) {

                conn = DBConnection.createConnection();
                statement = conn.createStatement();
                resultSet = statement.executeQuery("SELECT tenderdocs FROM tenders WHERE tenderid='" + id + "'");

                while (resultSet.next()) {
                    path = resultSet.getString("tenderdocs");
                    ++count;
                }

                if (count == 1) {

                    File my_file = new File(path);
                    String fileName = my_file.getName();
                    String headerKey = "Content-Disposition";
                    String headerValue = String.format("attachment; filename=\"%s\"", fileName);
                    response.setHeader(headerKey, headerValue);

                    OutputStream out = response.getOutputStream();
                    FileInputStream in = new FileInputStream(my_file);
                    byte[] buffer = new byte[4096];
                    int length;
                    while ((length = in.read(buffer)) > 0) {
                        out.write(buffer, 0, length);
                    }
                    in.close();
                    out.flush();

                }

            } else if (source.equals("bid")) {

                if (source2.equals("tech")) {

                    conn = DBConnection.createConnection();
                    statement = conn.createStatement();
                    resultSet = statement.executeQuery("SELECT techspec FROM bids WHERE bidid='" + id + "'");

                    while (resultSet.next()) {
                        path = resultSet.getString("techspec");
                        ++count;
                    }

                    if (count == 1) {

                        File my_file = new File(path);
                        String fileName = my_file.getName();
                        String headerKey = "Content-Disposition";
                        String headerValue = String.format("attachment; filename=\"%s\"", fileName);
                        response.setHeader(headerKey, headerValue);

                        OutputStream out = response.getOutputStream();
                        FileInputStream in = new FileInputStream(my_file);
                        byte[] buffer = new byte[4096];
                        int length;
                        while ((length = in.read(buffer)) > 0) {
                            out.write(buffer, 0, length);
                        }
                        in.close();
                        out.flush();

                    }

                } else if (source2.equals("tax")) {

                    conn = DBConnection.createConnection();
                    statement = conn.createStatement();
                    resultSet = statement.executeQuery("SELECT taxcompliance FROM bids WHERE bidid='" + id + "'");

                    while (resultSet.next()) {
                        path = resultSet.getString("taxcompliance");
                        ++count;
                    }

                    if (count == 1) {

                        File my_file = new File(path);
                        String fileName = my_file.getName();
                        String headerKey = "Content-Disposition";
                        String headerValue = String.format("attachment; filename=\"%s\"", fileName);
                        response.setHeader(headerKey, headerValue);

                        OutputStream out = response.getOutputStream();
                        FileInputStream in = new FileInputStream(my_file);
                        byte[] buffer = new byte[4096];
                        int length;
                        while ((length = in.read(buffer)) > 0) {
                            out.write(buffer, 0, length);
                        }
                        in.close();
                        out.flush();

                    }
                    
                } else if (source2.equals("pin")) {

                    conn = DBConnection.createConnection();
                    statement = conn.createStatement();
                    resultSet = statement.executeQuery("SELECT pincertificate FROM company WHERE companyid='" + id + "'");

                    while (resultSet.next()) {
                        path = resultSet.getString("pincertificate");
                        ++count;
                    }

                    if (count == 1) {

                        File my_file = new File(path);
                        String fileName = my_file.getName();
                        String headerKey = "Content-Disposition";
                        String headerValue = String.format("attachment; filename=\"%s\"", fileName);
                        response.setHeader(headerKey, headerValue);

                        OutputStream out = response.getOutputStream();
                        FileInputStream in = new FileInputStream(my_file);
                        byte[] buffer = new byte[4096];
                        int length;
                        while ((length = in.read(buffer)) > 0) {
                            out.write(buffer, 0, length);
                        }
                        in.close();
                        out.flush();

                    }

                } else if (source2.equals("fin")) {
                    
                    conn = DBConnection.createConnection();
                    statement = conn.createStatement();
                    resultSet = statement.executeQuery("SELECT financialhistory FROM bids WHERE bidid='" + id + "'");

                    while (resultSet.next()) {
                        path = resultSet.getString("financialhistory");
                        ++count;
                    }

                    if (count == 1) {

                        File my_file = new File(path);
                        String fileName = my_file.getName();
                        String headerKey = "Content-Disposition";
                        String headerValue = String.format("attachment; filename=\"%s\"", fileName);
                        response.setHeader(headerKey, headerValue);

                        OutputStream out = response.getOutputStream();
                        FileInputStream in = new FileInputStream(my_file);
                        byte[] buffer = new byte[4096];
                        int length;
                        while ((length = in.read(buffer)) > 0) {
                            out.write(buffer, 0, length);
                        }
                        in.close();
                        out.flush();

                    }
                    
                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
