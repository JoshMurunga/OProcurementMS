/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.procurement.bean;

import java.io.Serializable;

public class UserBean implements Serializable{
    private String firstname;
    private String lastname;
    private String username;
    private String email;
    private String password;
    private String contact;
    private String department;
    private String role;
    
    public UserBean(){
        firstname = "";
        lastname = "";
        username = "";
        email = "";
        password = "";
        contact = "";
        department = "";
        role = "";
    }
    
    public UserBean(String firstname, String lastname, String username, String email, String password, String contact, String department, String role){
        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.department = department;
        this.role = role;
    }
    
    public void setFirstName(String firstname) {
        this.firstname = firstname;
    }

    public String getFirstName() {
        return firstname;
    }

    public void setLastName(String lastname) {
        this.lastname = lastname;
    }

    public String getLastName() {
        return lastname;
    }
    
    public void setUserName(String username) {
        this.username = username;
    }

    public String getUserName() {
        return username;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getContact() {
        return contact;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDepartment() {
        return department;
    }
    
    public void setRole(String role) {
        this.role = role;
    }

    public String getRole() {
        return role;
    }
}