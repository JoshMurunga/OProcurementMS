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
import com.procurement.bean.TenderBean;

public class TenderDao {

    public String addTender(TenderBean tenBean) {
        String title = tenBean.getTitle();
        String category = tenBean.getCategory();
        String opendate = tenBean.getOpenDate();
        String closingdate = tenBean.getClosingDate();
        String description = tenBean.getDescription();
        String tenderdocs = tenBean.getTenderDocs();

        Connection conn = null;
        Statement statement = null;
        int ex = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            ex = statement.executeUpdate("INSERT INTO tenders (title,category,opendate,closingdate,description,tenderdocs)"
                    + " VALUES ('" + title + "','" + category + "','" + opendate + "','" + closingdate + "','" + description + "','" + tenderdocs + "')");

            if (ex > 0) {
                return "You have successfully added a tender";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Something went wrong, please try again";
    }
}
