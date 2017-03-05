/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.services;

import edu.secprog.security.AES;
import edu.secprog.security.Audit;
import edu.secprog.security.BCrypt;
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
    
    public void addPassword(String pass, int userID) {
        long insertID = -1;
        byte[] vector, encrypted;
        String hashed;
        PreparedStatement pstmt = null;
        Connection connection = null;
        ResultSet rs = null;

        /* Step 0: Parse the plaintext password
        */
        
        vector = AES.setVector();
        encrypted = AES.encryptString(pass, vector);
        
        hashed = BCrypt.hashpw(pass, BCrypt.gensalt(10));
        
        /* Step 1: Add the data to the user table, regardless if employee or customer
         */
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
            pstmt = connection.prepareStatement("INSERT INTO passwords(hashed, encrypted, vector, "
                    + "timestamp, userID) values(?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, hashed);
            pstmt.setBytes(2, encrypted);
            pstmt.setBytes(3, vector);
            pstmt.setTimestamp(4, Audit.getCurrentTimeStamp());
            pstmt.setInt(5, userID);
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
        } catch(ClassNotFoundException | SQLException e) {
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
}
