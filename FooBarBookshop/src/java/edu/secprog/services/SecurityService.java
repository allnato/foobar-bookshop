/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.services;

import edu.secprog.db.DBPool;
import edu.secprog.security.AES;
import edu.secprog.security.Audit;
import edu.secprog.security.BCrypt;
import edu.secprog.dto.Password;
import edu.secprog.dto.UserEvent;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CoRX
 */
public class SecurityService {
    
    // main model for the security packages
    
    public static void addPassword(Password ps) {
        long insertID = -1;
        PreparedStatement pstmt = null;
        Connection connection = null;
        ResultSet rs = null;
        
        /* Step 1: Add the data to the user table, regardless if employee or customer
         */
        try {
            connection = DBPool.getInstance().getConnection();
            pstmt = connection.prepareStatement("INSERT INTO passwords(hashed, encrypted, vector, "
                    + "timestamp, userID) values(?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, ps.getHashed());
            pstmt.setBytes(2, ps.getEncrypted());
            pstmt.setBytes(3, ps.getVector());
            pstmt.setTimestamp(4, ps.getTimestamp());
            pstmt.setInt(5, ps.getUserID());
            int affectedRows = pstmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Register failed! No rows affected");
            }
            // Check if registering is successful. Return ID generated
            try {
                rs = pstmt.getGeneratedKeys();
                if(rs.next()) {
                    insertID = rs.getLong(1);
                }
                else {
                    throw new SQLException("Register failed! No rows affected");
                }
            } catch(SQLException e) {
                System.out.println("Register failed! No rows affected");
                }
            // End CHeck if registering is successful
        } catch(SQLException e) {
            //put future audit codes here in the future
            }
        finally {
            try {
                pstmt.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SecurityService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public static int getPassOwner(String username) {
        ResultSet rs = null;
        int userID;
        
        try {
            Connection connection = DBPool.getInstance().getConnection();
            PreparedStatement pstmt = connection.prepareStatement("SELECT userID FROM users"
                    + " WHERE username= '" + username + "';");
            rs = pstmt.executeQuery();
            if(rs.isBeforeFirst()) {
                rs.next();
                
                userID = rs.getInt("userID");
                return userID;
            }
            
            connection.close();
            pstmt.close();
        } catch(SQLException e) {
            System.out.println("ANYARI HAHAHAHAAH LOL");
            e.printStackTrace();
        }
        
        return -1;
    }
    
    public static void addAuditLog(UserEvent ue) {
        
    }
}
