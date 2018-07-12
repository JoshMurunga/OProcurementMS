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
public class CompanyBean implements Serializable {

    private String companyname;
    private String email;
    private String contact;
    private String location;
    private String address;
    private String userid;

    public CompanyBean() {
        companyname = "";
        email = "";
        contact = "";
        location = "";
        address = "";
        userid = "";
    }
    
    public CompanyBean(String companyname, String email, String contact, String location, String address, String userid){
        this.companyname = companyname;
        this.email = email;
        this.contact = contact;
        this.location = location;
        this.address = address;
        this.userid = userid;
    }
    
    public void setCompanyName(String companyname) {
        this.companyname = companyname;
    }

    public String getCompanyName() {
        return companyname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }
    
    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getContact() {
        return contact;
    }
    
    public void setLocation(String location) {
        this.location = location;
    }

    public String getLocation() {
        return location;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }
    
    public void setUserId(String userid) {
        this.userid = userid;
    }

    public String getUserId() {
        return userid;
    }
}
