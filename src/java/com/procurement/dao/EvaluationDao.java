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
import com.procurement.bean.EvaluationBean;

public class EvaluationDao {

    String publisher = null;
    String companyid = null;
    String awardid = null;

    public String addEvaluation(EvaluationBean evBean) {
        double stage1 = evBean.getStage1();
        double stage2 = evBean.getStage2();
        String stage3 = evBean.getStage3();
        String bidid = evBean.getBidId();
        String committeeid = evBean.getCommitteeId();
        String tenderid = evBean.getTenderId();

        Connection conn = null;
        Statement statement = null;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            statement.executeUpdate("INSERT INTO evaluationlot (stage1,stage2,stage3,committeeid,bidid,tenderid)"
                    + " VALUES ('" + stage1 + "','" + stage2 + "','" + stage3 + "','" + committeeid + "','" + bidid + "','" + tenderid + "')");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "failed to add";
    }

    public String addPublication(String publish, String company) {
        publisher = publish;
        companyid = company;

        Connection conn = null;
        Statement statement = null;
        int ex = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            ex = statement.executeUpdate("UPDATE evaluationlot SET publish=true WHERE tenderid ='" + publisher + "' ");

            if (ex > 0) {

                statement.executeUpdate("INSERT INTO awardtender (tenderid,companyid,message)"
                        + "VALUES ('"+publisher+"','"+companyid+"','Your bid was successful and have been awarded the tender')");
                
                return "You have successfully published the tender outcome";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Something went wrong, please try again";
    }
    
    public String acceptAward(String id) {
        awardid = id;

        Connection conn = null;
        Statement statement = null;
        int ex = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            ex = statement.executeUpdate("UPDATE awardtender SET status='accepted' WHERE awardid ='" + awardid + "' ");


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "failed to add";
    }
    
    public String declineAward(String id) {
        awardid = id;

        Connection conn = null;
        Statement statement = null;
        int ex = 0;

        try {
            conn = DBConnection.createConnection();
            statement = conn.createStatement();

            ex = statement.executeUpdate("UPDATE awardtender SET status='declined' WHERE awardid ='" + awardid + "' ");


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "failed to add";
    }

}
