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
public class TenderBean implements Serializable {

    private String title;
    private String category;
    private String opendate;
    private String closingdate;
    private String description;
    private String dateofpublication;
    private String tenderdocs;

    public TenderBean() {
        title = "";
        category = "";
        opendate = "";
        closingdate = "";
        description = "";
        dateofpublication = "";
        tenderdocs = "";
    }
    
    public TenderBean(String title, String category, String opendate, String closingdate, String description, String dateofpublication, String tenderdocs){
        this.title = title;
        this.category = category;
        this.opendate = opendate;
        this.closingdate = closingdate;
        this.description = description;
        this.dateofpublication = dateofpublication;
        this.tenderdocs = tenderdocs;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }
    
    public void setOpenDate(String opendate) {
        this.opendate = opendate;
    }

    public String getOpenDate() {
        return opendate;
    }
    
    public void setClosingDate(String closingdate) {
        this.closingdate = closingdate;
    }

    public String getClosingDate() {
        return closingdate;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
    
    public void setDateOfPublication(String dateofpublication) {
        this.dateofpublication = dateofpublication;
    }

    public String getDateOfPublication() {
        return dateofpublication;
    }

    public void setTenderDocs(String tenderdocs) {
        this.tenderdocs = tenderdocs;
    }

    public String getTenderDocs() {
        return tenderdocs;
    }
}
