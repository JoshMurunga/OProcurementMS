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
public class BidBean implements Serializable {

    private String taxcompliance;
    private String financialhistory;
    private String techspecs;
    private String bidprice;
    private String companyid;
    private String tenderid;

    public BidBean() {
        taxcompliance = "";
        financialhistory = "";
        techspecs = "";
        bidprice = "";
        companyid = "";
        tenderid = "";
    }
    
    public BidBean(String taxcompliance, String financialhistory, String techspecs, String bidprice, String companyid, String tenderid){
        this.taxcompliance = taxcompliance;
        this.financialhistory = financialhistory;
        this.techspecs = techspecs;
        this.bidprice = bidprice;
        this.companyid = companyid;
        this.tenderid = tenderid;
    }
    
    public void setTaxCompliance(String taxcompliance) {
        this.taxcompliance = taxcompliance;
    }

    public String getTaxCompliance() {
        return taxcompliance;
    }
    
    public void setFinancialHistory(String financialhistory) {
        this.financialhistory = financialhistory;
    }

    public String getFinancialHistory() {
        return financialhistory;
    }
    
    public void setTechSpecs(String techspecs) {
        this.techspecs = techspecs;
    }

    public String getTechSpecs() {
        return techspecs;
    }
    
    public void setBidPrice(String bidprice) {
        this.bidprice = bidprice;
    }

    public String getBidPrice() {
        return bidprice;
    }
    
    public void setCompanyId(String companyid) {
        this.companyid = companyid;
    }

    public String getCompanyId() {
        return companyid;
    }

    public void setTenderId(String tenderid) {
        this.tenderid = tenderid;
    }

    public String getTenderId() {
        return tenderid;
    }
}
