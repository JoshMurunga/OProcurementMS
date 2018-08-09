/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.procurement.bean;

import java.io.Serializable;

/**
 *
 * @author Josh Murunga
 */
public class EvaluationBean implements Serializable {

    private double stage1;
    private double stage2;
    private String stage3;
    private String bidid;
    private String committeeid;
    private String tenderid;

    public EvaluationBean() {
        stage1 = 0;
        stage2 = 0;
        stage3 = "";
        bidid = "";
        committeeid = "";
        tenderid = "";
    }
    
    public EvaluationBean(double stage1, double stage2, String stage3, String bidid, String committeeid, String tenderid){
        this.stage1 = stage1;
        this.stage2 = stage2;
        this.stage3 = stage3;
        this.bidid = bidid;
        this.committeeid = committeeid;
        this.tenderid = tenderid;
    }
    
    public void setStage1(double stage1) {
        this.stage1 = stage1;
    }

    public double getStage1() {
        return stage1;
    }
    
    public void setStage2(double stage2) {
        this.stage2 = stage2;
    }

    public double getStage2() {
        return stage2;
    }
    
    public void setStage3(String stage3) {
        this.stage3 = stage3;
    }

    public String getStage3() {
        return stage3;
    }
    
    public void setBidId(String bidid) {
        this.bidid = bidid;
    }

    public String getBidId() {
        return bidid;
    }
    
    public void setCommitteeId(String committeeid) {
        this.committeeid = committeeid;
    }

    public String getCommitteeId() {
        return committeeid;
    }
    
    public void setTenderId(String tenderid) {
        this.tenderid = tenderid;
    }

    public String getTenderId() {
        return tenderid;
    }
}
