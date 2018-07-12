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
import com.procurement.bean.RequisitionBean;

public class RequisitionDao {

    public String reqValidate(RequisitionBean reqBean) {
        String item = reqBean.getItem();
        String category = reqBean.getCategory();
        String units = reqBean.getUnits();
        String unitprice = reqBean.getUnitPrice();
        String quantity = reqBean.getQuantity();
        String totalprice = reqBean.getTotalPrice();
        String supplier = reqBean.getSupplier();
        String userid = reqBean.getUserId();
        String description = reqBean.getDescription();

        Connection conn = null;
        Statement statement = null;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            statement.executeUpdate("INSERT INTO requisitions (item,units,priceperunit,quantity,totalprice,category,supplier,userid,description)"
                    + " VALUES ('" + item + "','" + units + "','" + unitprice + "','" + quantity + "','" + totalprice + "','" + category + "','" + supplier + "','"+ userid +"','"+ description +"')");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Failed To Register";
    }
}
