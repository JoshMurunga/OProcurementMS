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
public class RequisitionBean implements Serializable {

    private String item;
    private String category;
    private String units;
    private String unitprice;
    private String quantity;
    private String totalprice;
    private String supplier;
    private String userid;
    private String description;

    public RequisitionBean() {
        item = "";
        category = "";
        units = "";
        unitprice = "";
        quantity = "";
        totalprice = "";
        supplier = "";
        userid = "";
        description = "";
    }
    
    public RequisitionBean(String item, String category, String units, String unitprice, String quantity, String totalprice, String supplier, String userid, String description){
        this.item = item;
        this.category = category;
        this.units = units;
        this.unitprice = unitprice;
        this.quantity = quantity;
        this.totalprice = totalprice;
        this.supplier = supplier;
        this.userid = userid;
        this.description = description;
    }
    
    public void setItem(String item) {
        this.item = item;
    }

    public String getItem() {
        return item;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }
    
    public void setUnits(String units) {
        this.units = units;
    }

    public String getUnits() {
        return units;
    }
    
    public void setUnitPrice(String unitprice) {
        this.unitprice = unitprice;
    }

    public String getUnitPrice() {
        return unitprice;
    }
    
    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setTotalPrice(String totalprice) {
        this.totalprice = totalprice;
    }

    public String getTotalPrice() {
        return totalprice;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getSupplier() {
        return supplier;
    }
    
    public void setUserId(String userid) {
        this.userid = userid;
    }

    public String getUserId() {
        return userid;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
