 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.services;

import edu.secprog.dto.CreditCard;
import edu.secprog.dto.Customer;
import edu.secprog.dto.CustomerAddress;
import java.util.ArrayList;

import edu.secprog.dto.Employee;
import edu.secprog.security.BCrypt;
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

    public static ArrayList<Employee> getAllEmployees(){
        ArrayList<Employee> employeeList = new ArrayList<Employee>();
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
            PreparedStatement pstmt = connection.prepareStatement("SELECT employeeType FROM employees;");
            rs = pstmt.executeQuery();
            while(rs.next()) {
               Employee e = new Employee();
               e.setEmployeeType(rs.getString(Employee.COLUMN_EMPLOYEETYPE));
               employeeList.add(e);
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        return employeeList;
    }
    
    public static boolean verifyLogin(String username, String password) {
        
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
            PreparedStatement pstmt = connection.prepareStatement("SELECT status, password FROM users"
                    + " WHERE username= '" + username + "';");
            rs = pstmt.executeQuery();
            if(rs.isBeforeFirst()) {
                connection.close();
                pstmt.close();
                if(BCrypt.checkpw(password, rs.getString("password")))
                    return true;
            }
            return false;
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    public static boolean registerUser(Customer nc, CustomerAddress bca, CustomerAddress dca, CreditCard cc) throws ClassNotFoundException {
        
        long insertID = -1;
        long customerID = -1;
        long creditCardID = -1;
        ResultSet rs = null;
        /* Step 1: Add the data to the user table, regardless if employee or customer
         */
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO users(firstname, lastname,"
                    + "middleinitial,birthdate,email,username,password,status) values("
                    + "?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, nc.getFirstname());
            pstmt.setString(2, nc.getLastname());
            pstmt.setString(3, nc.getMiddleinitial());
            pstmt.setString(4, nc.getBirthdate());
            pstmt.setString(5, nc.getEmail());
            pstmt.setString(6, nc.getUsername());
            pstmt.setString(7, nc.getPassword());
            pstmt.setString(8, nc.getStatus());
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
        } catch(Exception e) {
            e.printStackTrace();
        }
        /* Step 2: Add date registered and generated ID to the customers table
         */
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
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
        } catch(Exception e) {
            e.printStackTrace();
        }
        /* Step 3: Add the billing and delivery address data to the customer_address table
         */
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO customer_address(customerID, addressType,"
                    + "address,city,zipcode,region,country) "
                    + "values(?,?,?,?,?,?,?)");
            pstmt.setLong(1, customerID);
            pstmt.setString(2, bca.getAddressType());
            pstmt.setString(3, bca.getAddress());
            pstmt.setString(4, bca.getCity());
            pstmt.setInt(5, bca.getZipcode());
            pstmt.setString(6, bca.getRegion());
            pstmt.setString(7, bca.getCountry());
            
            pstmt.executeUpdate();
            pstmt = connection.prepareStatement("INSERT INTO customer_address(customerID, addressType,"
                    + "address,city,zipcode,region,country) "
                    + "values(?,?,?,?,?,?,?)");
            pstmt.setLong(1, customerID);
            pstmt.setString(2, dca.getAddressType());
            pstmt.setString(3, dca.getAddress());
            pstmt.setString(4, dca.getCity());
            pstmt.setInt(5, dca.getZipcode());
            pstmt.setString(6, dca.getRegion());
            pstmt.setString(7, dca.getCountry());
        }
        catch(SQLException e) {
                System.out.println("May problem sa mga addresses");
        }

//        
//        /* Step 5: Add the credit card to the credit_cards table
//         */
//                
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection connection = DriverManager.getConnection(
//                    "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
//            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO credit_cards(name, cardNum,"
//                    + "type, expDate) "
//                    + "values(?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
//            pstmt.setString(1, cc.getName());
//            pstmt.setString(2, cc.getCardNum());
//            pstmt.setString(3, cc.getType());
//            pstmt.setString(4, cc.getExpDate());
//            int affected = pstmt.executeUpdate();
//            // Check if registering is successful. Return creditcardID generated
//            try {
//                rs = pstmt.getGeneratedKeys();
//                if(rs.next()) {
//                    creditCardID = rs.getLong(1);
//                }
//                else {
//                    throw new SQLException("Register failed! No rows affected");
//                }
//            } catch(SQLException e) {
//                System.out.println("Register failed! No rows affected");
//            }
//            // End Check if registering is successful
//            
//        }
//        catch(SQLException e) {
//                System.out.println("Register failed! No rows affected");
//        }
//        
//        /* Step 6: Add the credit card ID to the customer_cards table
//         */
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection connection = DriverManager.getConnection(
//                    "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
//            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO customer_cards(customerID, creditcardID) values(?,?)");
//            pstmt.setLong(1, customerID);
//            pstmt.setLong(2, creditCardID);
//            pstmt.executeUpdate();
//
//        }
//        catch(SQLException e) {
//                System.out.println("Register failed! No rows affected");
//        }
        
        return false;
    }
    
}
