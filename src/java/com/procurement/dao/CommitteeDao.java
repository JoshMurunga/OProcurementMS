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
import com.procurement.bean.CommitteeBean;

public class CommitteeDao {
    
    public String addMember(CommitteeBean comBean){
        String tenderid = comBean.getTenderId();
        String userid = comBean.getUserId();
        String expertise = comBean.getExpertise();
        
        Connection conn = null;
        Statement statement = null;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            statement.executeUpdate("INSERT INTO committee (userid,expertise,tenderid)"
                    + " VALUES ('" + userid + "','" + expertise + "','" + tenderid + "')");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return "failed to add";
    }
    
}
