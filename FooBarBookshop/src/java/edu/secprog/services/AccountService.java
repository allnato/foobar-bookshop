 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.services;

import edu.secprog.db.DBPool;
import edu.secprog.dto.CreditCard;
import edu.secprog.dto.Customer;
import edu.secprog.dto.CustomerAddress;
import edu.secprog.dto.User;
import edu.secprog.security.Audit;
import edu.secprog.security.BCrypt;
import edu.secprog.security.IDPair;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author Mark Christian Sanchez
 */
public class AccountService {

    public static boolean checkAttempts(int userID, String uStatus) {
        ResultSet rs = null;
        if(uStatus.equals("active")) {
            try {
                Connection connection = DBPool.getInstance().getConnection();
                // Check for three successful fails
                PreparedStatement pstmt = connection.prepareStatement("SELECT COUNT(*) AS count FROM logins"
                        + " WHERE userID= '" + userID + "' AND status= " + "'failed'"
                        + " ORDER BY timestamp DESC LIMIT 3;");
                rs = pstmt.executeQuery();
                if(rs.isBeforeFirst()) {
                    rs.next();
                    int count = rs.getInt("count");
                    if(count >= 3) {
                        System.out.println("HOI LOCKED NA BES");
                        connection.close();
                        pstmt.close();
                        return false;
                    }
                    else {
                        connection.close();
                        pstmt.close();
                        return true;
                    }
                }
            }
            catch(SQLException e) {
                System.out.println("SQL Exception!!!"); // remove in the future
                Audit.getAuditLog(userID, Audit.SQLEX);
                }
        }
        else {
            return false;
        }
        return false;
    }
    
    // used for forgot password
    
    public static boolean checkPrevPassword(String username, String password) {
        ResultSet rs = null;
        String status;
        try {
            Connection connection = DBPool.getInstance().getConnection();
            PreparedStatement pstmt = connection.prepareStatement("SELECT u.userID, hashed FROM users u, "
                    + " passwords WHERE username= '" + username + "';");
            rs = pstmt.executeQuery();
            if(rs.isBeforeFirst()) {
             // If User Exists, check the number of attempts then check the password
                rs.next();
                
                if(!BCrypt.checkpw(password, rs.getString("hashed"))) {
                    return true;
                }
            }
            connection.close();
            pstmt.close();
            
        }catch(SQLException e) {
            System.out.println("ANYARI HAHAHAHAAH LOL");
            e.printStackTrace();
        }
        
        return false;
    }
    
    public static IDPair verifyExists(String username, String password) {
        ResultSet rs = null;
        String status;
        int id = 0;
        
        try {
            Connection connection = DBPool.getInstance().getConnection();
            PreparedStatement pstmt = connection.prepareStatement("SELECT u.username, u.status, u.userID, hashed FROM users u, "
                    + " passwords p WHERE u.username= '" + username + "' AND p.userID=u.userID;");
            rs = pstmt.executeQuery();
            if(rs.isBeforeFirst()) {
             // If User Exists, check the number of attempts then check the password
                rs.next();
                
                if(BCrypt.checkpw(password, rs.getString("hashed"))) {
                    status = rs.getString("u.status");
                    id = rs.getInt("u.userID");
                    return new IDPair(id, status);
                }
            }
            connection.close();
            pstmt.close();
            return new IDPair(0, "invalid");
            
        }catch(SQLException e) {
            System.out.println("SQL Exception!!!: " + e.getMessage());
            Audit.getAuditLog(id, Audit.SQLEX);
        }
        
        return new IDPair(0, "invalid");
    }
    
    public static int getIDByEmail(String email) {
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
            PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM users");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                System.out.println("Yung email kasi " + rs.getString("email"));
                if(BCrypt.checkpw(email, rs.getString("email"))) {
                    return rs.getInt("userID");
                }
                
            }
            connection.close();
            pstmt.close();
            
        }catch(ClassNotFoundException | SQLException e) {
            System.out.println("ANYARI HAHAHAHAAH LOL");
            e.printStackTrace();
        }
        
        
        return -1;
    }
    
    public static boolean registerUser(Customer nc, CustomerAddress bca, CustomerAddress dca, CreditCard cc) throws ClassNotFoundException {
        
        long insertID = -1;
        long customerID = -1;
        long creditCardID = -1;
        ResultSet rs = null;
        /* Step 1: Add the data to the user table, regardless if employee or customer
         */
        try {
            Connection connection = DBPool.getInstance().getConnection();
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO users(firstname, lastname,"
                    + "middleinitial,birthdate,email,username,status) values("
                    + "?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, nc.getFirstname());
            pstmt.setString(2, nc.getLastname());
            pstmt.setString(3, nc.getMiddleinitial());
            pstmt.setString(4, nc.getBirthdate());
            pstmt.setString(5, nc.getEmail());
            pstmt.setString(6, nc.getUsername());
            pstmt.setString(7, nc.getStatus());
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
        }
        /* Step 2: Add date registered and generated ID to the customers table
         */
        try {
            Connection connection = DBPool.getInstance().getConnection();
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO customers(userID, dateRegistered) "
                    + "values(?,?)", Statement.RETURN_GENERATED_KEYS);
            pstmt.setLong(1, insertID);
            pstmt.setString(2, nc.getDateRegistered());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Register failed! No rows affected");
            }
            // Check if registering is successful. Return CustomerID generated
            try {
                rs = pstmt.getGeneratedKeys();
                if(rs.next()) {
                    customerID = rs.getLong(1);
                }
                else {
                    throw new SQLException("Register failed! No rows affected");
                }
            } catch(SQLException e) {
                System.out.println("Register failed! No rows affected");
            }
            // End Check if registering is successful
        } catch(SQLException e) {
        }
        /* Step 3: Add the billing and delivery address data to the customer_address table
         */
        try {
            Connection connection = DBPool.getInstance().getConnection();
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO customer_address(customerID, addressType,"
                    + "address,city,zipcode,region,country) "
                    + "values(?,?,?,?,?,?,?)");
            pstmt.setLong(1, customerID);
            pstmt.setString(2, bca.getAddressType());
            pstmt.setString(3, bca.getAddress());
            pstmt.setString(4, bca.getCity());
            pstmt.setString(5, bca.getZipcode());
            pstmt.setString(6, bca.getRegion());
            pstmt.setString(7, bca.getCountry());
            
            pstmt.executeUpdate();
            pstmt = connection.prepareStatement("INSERT INTO customer_address(customerID, addressType, "
                    + "address,city,zipcode,region,country) "
                    + "values(?,?,?,?,?,?,?)");
            pstmt.setLong(1, customerID);
            pstmt.setString(2, dca.getAddressType());
            pstmt.setString(3, dca.getAddress());
            pstmt.setString(4, dca.getCity());
            pstmt.setString(5, dca.getZipcode());
            pstmt.setString(6, dca.getRegion());
            pstmt.setString(7, dca.getCountry());
            pstmt.executeUpdate();
        }
        catch(SQLException e) {
                e.printStackTrace();
                System.out.println("May problem sa mga addresses");    
        }

        /* Step 5: Add the credit card to the credit_cards table
         */
                
        try {
            Connection connection = DBPool.getInstance().getConnection();
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO credit_cards(name, cardNum,"
                    + "type, expDate) "
                    + "values(?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, cc.getName());
            pstmt.setString(2, cc.getCardNum());
            pstmt.setString(3, cc.getType());
            pstmt.setString(4, cc.getExpDate());
            int affected = pstmt.executeUpdate();
            // Check if registering is successful. Return creditcardID generated
            try {
                rs = pstmt.getGeneratedKeys();
                if(rs.next()) {
                    creditCardID = rs.getLong(1);
                }
                else {
                    throw new SQLException("Boss may problems");
                }
            } catch(SQLException e) {
                e.printStackTrace();
                System.out.println("Register failed! No rows affected");
            }
            // End Check if registering is successful
            
        }
        catch(Exception e) {
                e.printStackTrace();
                System.out.println("Lahat may problema");
        }
        
        /* Step 6: Add the credit card ID to the customer_cards table
         */
        try {
            Connection connection = DBPool.getInstance().getConnection();
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO customer_cards(customerID, creditcardID) values(?,?)");
            pstmt.setLong(1, insertID);
            pstmt.setLong(2, creditCardID);
            System.out.println("Customer ID: " + insertID);
            pstmt.executeUpdate();

        }
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("Dami nanamang problem ano ba yan.");
        }
        
        return true;
    }
    
    public static User getUserInfo(int userID) {
         ResultSet rs = null;
        String status;
        try {
            Connection connection = DBPool.getInstance().getConnection();
            PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM users"
                    + " WHERE userID= '" + userID + "';");
            rs = pstmt.executeQuery();
            if(rs.isBeforeFirst()) {
               rs.next();
               User user = new User();
               user.setFirstname(rs.getString(User.COLUMN_FIRSTNAME));
               user.setLastname(rs.getString(User.COLUMN_LASTNAME));
               user.setMiddleinitial(rs.getString(User.COLUMN_MIDDLEINITIAL));
               user.setBirthdate(rs.getString(User.COLUMN_BIRTHDATE));
               user.setUsername(rs.getString(User.COLUMN_USERNAME));
               user.setUserID(rs.getInt(User.COLUMN_USERID));
               return user;
            }
            
            connection.close();
            pstmt.close();
            
        }catch(SQLException e) {
            System.out.println("ANYARI HAHAHAHAAH LOL");
            e.printStackTrace();
        }
        
        return null;
    }
    
}
