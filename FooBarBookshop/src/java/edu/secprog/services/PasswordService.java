/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.UUID;

/**
 *
 * @author Mark Christian Sanchez
 */
public class PasswordService {
        static final long NUM_100NS_INTERVALS_SINCE_UUID_EPOCH = 0x01b21dd213814000L;
        public static UUID generateToken() {
            
            UUID uuid = UUID.randomUUID();
            
            return uuid;
        }
        
        public static Date DateFromUUID(UUID uuid) {
            long time = uuid.timestamp() - NUM_100NS_INTERVALS_SINCE_UUID_EPOCH / 10000;
            Date date = new Date(time);
            return date;
        } 
        
        public static boolean registerUIDToDB(int userID, String token, String email) {
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO token(userID, token,"
                    + "isActive) values("
                    + "?,?,?)", Statement.RETURN_GENERATED_KEYS);
            rs = pstmt.executeQuery();
            }
            catch(ClassNotFoundException | SQLException e) {
                
            }
            return false;
        }
}
