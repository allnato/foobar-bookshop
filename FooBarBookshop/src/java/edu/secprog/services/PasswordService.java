/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.services;

import com.fasterxml.uuid.EthernetAddress;
import com.fasterxml.uuid.Generators;
import com.fasterxml.uuid.impl.TimeBasedGenerator;
import edu.secprog.db.DBPool;
import edu.secprog.dto.Password;
import edu.secprog.security.AES;
import edu.secprog.security.Audit;
import edu.secprog.security.BCrypt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mark Christian Sanchez
 */
public class PasswordService {
        static final long NUM_100NS_INTERVALS_SINCE_UUID_EPOCH = 0x01b21dd213814000L;
        public static UUID generateToken() {
            
              EthernetAddress addr = EthernetAddress.fromInterface();
              TimeBasedGenerator uuidGenerator = Generators.timeBasedGenerator(addr);
              UUID uuid = uuidGenerator.generate();
            
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
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO token(userID, token.token,"
                    + "isActive) values("
                    + "?,?,?)", Statement.RETURN_GENERATED_KEYS);
                    pstmt.setInt(1, userID);
                    pstmt.setString(2, token);
                    pstmt.setString(3, "Yes");
                    pstmt.executeUpdate();
                    connection.close();
                    pstmt.close();
            }
            catch(ClassNotFoundException | SQLException e) {
                
            }
            return false;
        }
        
        public static boolean checkValidityOfToken(String userID, String token) {
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
                PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM token WHERE token='" + token +"' AND userID='" + userID + "'");
                rs = pstmt.executeQuery();
                if(rs.isBeforeFirst()) {
                    //There exists
                    pstmt = connection.prepareStatement("UPDATE token SET isActive = ? WHERE token='" + token +"' AND userID='" + userID + "'");
                    pstmt.setString(1, "No");
                    pstmt.executeUpdate();
                    connection.close();
                    pstmt.close();
                    return true;
                    
                }
            }
            catch(ClassNotFoundException | SQLException e) {
                
            }
            
            return false;
        }
        
        public static boolean updatePassword (Password ps) {
            ResultSet rs = null;
            Connection connection = null;
            PreparedStatement pstmt = null;
            
            try {
                connection = DBPool.getInstance().getConnection();
                pstmt = connection.prepareStatement("UPDATE passwords SET hashed = ?, encrypted = ?, vector = ?, timestamp = ? WHERE userID='" 
                        + ps.getUserID() + "'");
                
                pstmt.setString(1, ps.getHashed());
                pstmt.setBytes(2, ps.getEncrypted());
                pstmt.setBytes(3, ps.getVector());
                pstmt.setTimestamp(4, ps.getTimestamp());
                
                pstmt.executeUpdate();
                connection.close();
                pstmt.close();
                return true;
            }
            catch(SQLException e) {
                // Logger here
            }
            finally {
                try {
                    if (pstmt != null)
                        pstmt.close();
                    if (connection != null)
                        connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SecurityService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            return false;
        }
}
