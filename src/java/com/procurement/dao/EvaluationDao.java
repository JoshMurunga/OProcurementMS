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
    
    public String addEvaluation(EvaluationBean evBean){
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
    
}
