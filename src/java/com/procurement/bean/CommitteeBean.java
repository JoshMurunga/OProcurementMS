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
public class CommitteeBean implements Serializable {

    private String tenderid;
    private String userid;
    private String expertise;

    public CommitteeBean() {
        tenderid = "";
        userid = "";
        expertise = "";
    }
    
    public CommitteeBean(String tenderid, String userid, String expertise){
        this.tenderid = tenderid;
        this.userid = userid;
        this.expertise = expertise;
    }
    
    public void setTenderId(String tenderid) {
        this.tenderid = tenderid;
    }

    public String getTenderId() {
        return tenderid;
    }
    
    public void setUserId(String userid) {
        this.userid = userid;
    }

    public String getUserId() {
        return userid;
    }
    
    public void setExpertise(String expertise) {
        this.expertise = expertise;
    }

    public String getExpertise() {
        return expertise;
    }
}
