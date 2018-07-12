/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.procurement.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import com.util.database.DBConnection;
import com.procurement.bean.CompanyBean;

/**
 *
 * @author Josh Murunga
 */
public class CompanyDao {

    public String addCompany(CompanyBean comBean) {
        String companyname = comBean.getCompanyName();
        String email = comBean.getEmail();
        String contact = comBean.getContact();
        String location = comBean.getLocation();
        String address = comBean.getAddress();
        String userid = comBean.getUserId();
        
        Connection conn = null;
        Statement statement = null;
        
        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            statement.executeUpdate("INSERT INTO company (companyname,contact,email,postaladdress,location,userid)"
                    + " VALUES ('" + companyname + "','" + contact + "','" + email + "','" + address + "','" + location + "','" + userid + "')");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Failed To Register";
    }
}
