/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util.database;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Josh Murunga
 */
public class DBConnection {

    public static Connection createConnection() {
        Connection conn = null;
        String url = "jdbc:postgresql://localhost:5432/opms";
        String username = "postgres";
        String password = "1234";

        try {
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Post esatblishing a DB connection - " +conn);
        } catch(Exception e){
            e.printStackTrace();
        }
        
        return conn;
    }
}
