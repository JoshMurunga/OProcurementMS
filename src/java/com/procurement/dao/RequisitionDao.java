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

    String requisitionid = null;

    public String reqValidate(RequisitionBean reqBean) {
        String item = reqBean.getItem();
        String category = reqBean.getCategory();
        String units = reqBean.getUnits();
        String unitprice = reqBean.getUnitPrice();
        String quantity = reqBean.getQuantity();
        String totalprice = reqBean.getTotalPrice();
        String userid = reqBean.getUserId();
        String description = reqBean.getDescription();

        Connection conn = null;
        Statement statement = null;
        int ex = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            ex = statement.executeUpdate("INSERT INTO requisitions (item,category,units,priceperunit,quantity,totalprice,userid,description) "
                    + "VALUES ('" + item + "','" + category + "','" + units + "','" + unitprice + "','" + quantity + "','" + totalprice + "','" + userid + "','" + description + "')");
            
            if (ex > 0) {
                return "You successfully added a new requisition";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "something went wrong, please try again";
    }
    
    public String reqEdit(RequisitionBean reqBean, String myreqid) {
        String item = reqBean.getItem();
        String category = reqBean.getCategory();
        String units = reqBean.getUnits();
        String unitprice = reqBean.getUnitPrice();
        String quantity = reqBean.getQuantity();
        String totalprice = reqBean.getTotalPrice();
        String description = reqBean.getDescription();
        requisitionid = myreqid;

        Connection conn = null;
        Statement statement = null;
        int ex = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            ex = statement.executeUpdate("UPDATE requisitions set item='"+item+"', category='"+category+"', units='"+units+"', priceperunit='"+unitprice+"', quantity='"+quantity+"', totalprice='"+totalprice+"', description='"+description+"', status='pending' WHERE requisitionid='"+requisitionid+"'");
            
            if (ex > 0) {
                return "You successfully edited the requisition";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "something went wrong, please try again";
    }

    public String reqDelete(String myid) {
        requisitionid = myid;

        Connection conn = null;
        Statement statement = null;
        int ex = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            ex = statement.executeUpdate("DELETE FROM requisitions WHERE requisitionid='" + requisitionid + "'");

            if (ex > 0) {
                return "You successfully removed the selected requisition";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "something went wrong, please try again";
    }

    public String reqApprove(String myid) {
        requisitionid = myid;

        Connection conn = null;
        Statement statement = null;
        int ex = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            ex = statement.executeUpdate("UPDATE requisitions SET status='approved' WHERE requisitionid='" + requisitionid + "'");
            
            if (ex > 0) {
                return "You successfully approved the selected requisition";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "something went wrong, please try again";
    }

    public String reqDecline(String myid) {
        requisitionid = myid;

        Connection conn = null;
        Statement statement = null;
        int ex = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            ex = statement.executeUpdate("UPDATE requisitions SET status='declined' WHERE requisitionid='" + requisitionid + "'");
            
            if (ex > 0) {
                return "You successfully declined the selected requisition";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "something went wrong, please try again";
    }
}
