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
import com.procurement.bean.BidBean;

public class BidDao {

    public String addBid(BidBean bidBean) {
        String taxcompliance = bidBean.getTaxCompliance();
        String pincertificate = bidBean.getPinCertificate();
        String financialhistory = bidBean.getFinancialHistory();
        String techspecs = bidBean.getTechSpecs();
        String bidprice = bidBean.getBidPrice();
        String companyid = bidBean.getCompanyId();
        String tenderid = bidBean.getTenderId();
        
        Connection conn = null;
        Statement statement = null;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            statement.executeUpdate("INSERT INTO bids (taxcompliance,pincertificate,financialhistory,techspec,bidprice,companyid,tenderid)"
                    + " VALUES ('" + taxcompliance + "','" + pincertificate + "','" + financialhistory + "','" + techspecs + "','" + bidprice + "','" + companyid + "','" + tenderid + "')");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Failed to register";
    }

}
