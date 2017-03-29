/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.services;

import edu.secprog.db.DBPool;
import edu.secprog.dto.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CoRX
 */
public class EmployeeService {
    
    private static final String DELIM = "$";
    
    public static List<String> getLockAccounts() {
        PreparedStatement pstmt = null;
        Connection connection = null;
        ResultSet rs = null;
        
        List<String> accList = new ArrayList<String>();
        String data = null;
//        List<Integer> userID = new ArrayList<Integer>();
//        ArrayList<String> accountType = new ArrayList<String>();
//        ArrayList<String> accountName = new ArrayList<String>();
//        ArrayList<String> lastLogin = new ArrayList<String>();
//        ArrayList<String> status = new ArrayList<String>();
        
        try {
            connection = DBPool.getInstance().getConnection();
            pstmt = connection.prepareStatement(
                    "SELECT u.userID, employeeType, u.lastname, u.firstname, u.middleinitial, u.birthdate, u.status " +
                    "FROM users u, employees e " +
                    "WHERE u.userID = e.userID " +
                    "UNION " +
                    "SELECT userID, 'Customer' AS employeeType, lastname, firstname, middleinitial, birthdate, status " +
                    "FROM users " +
                    "WHERE userID NOT IN ( " +
                        "SELECT u.userID " +
                        "FROM users u, employees e " +
                        "WHERE u.userID=e.userID " +
                    ");");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                data = "" + rs.getInt("userID") + DELIM + rs.getString("employeeType") + DELIM +
                        rs.getString("lastname") + ", " + rs.getString("firstname") 
                        + " " + rs.getString("middleinitial") + "." + DELIM + rs.getString("birthdate")
                        + DELIM + rs.getString("status");
                
                accList.add(data); 
            }
            
            return accList;
        } catch(SQLException e) {
            //put future audit codes here in the future
        }
        finally {
            try {
                pstmt.close();
                connection.close();
            } catch (SQLException ex) {
                // replace this in the future
                // what if the logger that logs fail itself? How can it log itself?
                Logger.getLogger(SecurityService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return null;
    }
    
    public static List<String> getProductManagers() {
        PreparedStatement pstmt = null;
        Connection connection = null;
        ResultSet rs = null;
        
        List<String> accList = new ArrayList<String>();
        String data = null;
//        List<Integer> userID = new ArrayList<Integer>();
//        ArrayList<String> accountType = new ArrayList<String>();
//        ArrayList<String> accountName = new ArrayList<String>();
//        ArrayList<String> lastLogin = new ArrayList<String>();
//        ArrayList<String> status = new ArrayList<String>();
        
        try {
            connection = DBPool.getInstance().getConnection();
            pstmt = connection.prepareStatement(
                    "SELECT managerID, lastname, firstname, type, birthdate " +
                    "FROM users u, employees e, product_type p " +
                    "WHERE u.userID = e.userID AND e.employeeID = p.managerID AND e.employeeType = 'Product Manager';");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                data = "" + rs.getInt("managerID") + DELIM + rs.getString("lastname") + DELIM +
                        rs.getString("firstname") + DELIM + rs.getString("type")
                        + DELIM + rs.getString("birthdate");
                
                accList.add(data); 
            }
            
            return accList;
        } catch(SQLException e) {
            //put future audit codes here in the future
        }
        finally {
            try {
                pstmt.close();
                connection.close();
            } catch (SQLException ex) {
                // replace this in the future
                // what if the logger that logs fail itself? How can it log itself?
                Logger.getLogger(SecurityService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return null;
    }
    
    public static List<String> getSalesManagers() {
        PreparedStatement pstmt = null;
        Connection connection = null;
        ResultSet rs = null;
        
        List<String> accList = new ArrayList<String>();
        String data = null;
//        List<Integer> userID = new ArrayList<Integer>();
//        ArrayList<String> accountType = new ArrayList<String>();
//        ArrayList<String> accountName = new ArrayList<String>();
//        ArrayList<String> lastLogin = new ArrayList<String>();
//        ArrayList<String> status = new ArrayList<String>();
        
        try {
            connection = DBPool.getInstance().getConnection();
            pstmt = connection.prepareStatement(
                    "SELECT employeeID, lastname, firstname, birthdate " +
                    "FROM users u, employees e " +
                    "WHERE u.userID = e.userID AND e.employeeType = 'Sales Manager';");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                data = "" + rs.getInt("employeeID") + DELIM + rs.getString("lastname") + DELIM +
                        rs.getString("firstname") + DELIM + rs.getString("birthdate");
                
                accList.add(data); 
            }
            
            return accList;
        } catch(SQLException e) {
            //put future audit codes here in the future
        }
        finally {
            try {
                pstmt.close();
                connection.close();
            } catch (SQLException ex) {
                // replace this in the future
                // what if the logger that logs fail itself? How can it log itself?
                Logger.getLogger(SecurityService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return null;
    }
    
    public static List<String> getProductList(String category) {
        PreparedStatement pstmt = null;
        Connection connection = null;
        ResultSet rs = null;
        
        List<String> accList = new ArrayList<String>();
        String data = null;
//        List<Integer> userID = new ArrayList<Integer>();
//        ArrayList<String> accountType = new ArrayList<String>();
//        ArrayList<String> accountName = new ArrayList<String>();
//        ArrayList<String> lastLogin = new ArrayList<String>();
//        ArrayList<String> status = new ArrayList<String>();
        
        try {
            connection = DBPool.getInstance().getConnection();
            pstmt = connection.prepareStatement(
                    "SELECT productID, name, price, description " +
                    "FROM product p, product_type pt " +
                    "WHERE p.productTypeID = pt.typeID AND pt.type = '" + category + "';");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                data = "" + rs.getInt("productID") + DELIM + rs.getString("name") + DELIM +
                        rs.getString("price") + DELIM + rs.getString("description");
                
                accList.add(data); 
            }
            
            return accList;
        } catch(SQLException e) {
            //put future audit codes here in the future
        }
        finally {
            try {
                pstmt.close();
                connection.close();
            } catch (SQLException ex) {
                // replace this in the future
                // what if the logger that logs fail itself? How can it log itself?
                Logger.getLogger(SecurityService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return null;
    }
    
    public static String getProductCategory(int userID) {
        PreparedStatement pstmt = null;
        Connection connection = null;
        ResultSet rs = null;
        
        System.out.println("userID in emp service: " + userID);
        
        String category;
        
        try {
            connection = DBPool.getInstance().getConnection();
            pstmt = connection.prepareStatement(
                    "SELECT type " +
                    "FROM users u, employees e, product_type pt " +
                    "WHERE u.userID = " + userID + " AND u.userID = e.userID AND e.employeeID = pt.managerID AND e.employeeType = 'Product Manager';");
            rs = pstmt.executeQuery();
            if(rs.isBeforeFirst()) {
                rs.next();
                
                category = rs.getString("type");
                return category;
            }
        } catch(SQLException e) {
            //put future audit codes here in the future
        }
        finally {
            try {
                pstmt.close();
                connection.close();
            } catch (SQLException ex) {
                // replace this in the future
                // what if the logger that logs fail itself? How can it log itself?
                Logger.getLogger(SecurityService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return null;
    }
    
    public static List<String> getTopProductSales() {
        PreparedStatement pstmt = null;
        Connection connection = null;
        ResultSet rs = null;
        
        List<String> accList = new ArrayList<String>();
        String data = null;
        
        try {
            connection = DBPool.getInstance().getConnection();
            pstmt = connection.prepareStatement(
                "SELECT name, COUNT(datePurchased) * pl.productQuantity AS purchaseTotal, SUM(totalAmount) AS salesTotal " +
                "FROM product p, product_list pl, transaction t, product_type pt " +
                "WHERE p.productID = pl.productID AND pl.cartID = t.cartID AND p.productTypeID = pt.typeID " +
                "GROUP BY p.productID " +
                "HAVING COUNT(datePurchased) IN ( " +
                "	SELECT COUNT(datePurchased) " +
                "	FROM product q_p, transaction t, product_list pl " +
                "	WHERE q_p.productID = p.productID AND q_p.productID = pl.productID AND t.cartID = pl.cartID " +
                "	GROUP BY pl.productID) " +
                "    AND SUM(totalAmount) IN ( " +
                "	SELECT SUM(totalAmount) " +
                "	FROM product q_p, transaction t, product_list pl " +
                "	WHERE q_p.productID = p.productID AND q_p.productID = pl.productID AND t.cartID = pl.cartID " +
                "	GROUP BY pl.productID) " +
                "ORDER BY salesTotal DESC " +
                "LIMIT 5;");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                data = "" + rs.getString("name") + DELIM + rs.getString("purchaseTotal") + DELIM +
                        rs.getString("salesTotal");
                
                accList.add(data); 
            }
            
            return accList;
        } catch(SQLException e) {
            //put future audit codes here in the future
        }
        finally {
            try {
                pstmt.close();
                connection.close();
            } catch (SQLException ex) {
                // replace this in the future
                // what if the logger that logs fail itself? How can it log itself?
                Logger.getLogger(SecurityService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return null;
    }
    
    public static List<String> getAllProductSales() {
        PreparedStatement pstmt = null;
        Connection connection = null;
        ResultSet rs = null;
        
        List<String> accList = new ArrayList<String>();
        String data = null;
        
        try {
            connection = DBPool.getInstance().getConnection();
            pstmt = connection.prepareStatement(
                "SELECT name, type, COUNT(datePurchased) * pl.productQuantity AS purchaseTotal, SUM(totalAmount) AS salesTotal " +
                "FROM product p, product_list pl, transaction t, product_type pt " +
                "WHERE p.productID = pl.productID AND pl.cartID = t.cartID AND p.productTypeID = pt.typeID " +
                "GROUP BY p.productID " +
                "HAVING COUNT(datePurchased) IN ( " +
                "	SELECT COUNT(datePurchased) " +
                "	FROM product q_p, transaction t, product_list pl " +
                "	WHERE q_p.productID = p.productID AND q_p.productID = pl.productID AND t.cartID = pl.cartID " +
                "	GROUP BY pl.productID) " +
                "    AND SUM(totalAmount) IN ( " +
                "	SELECT SUM(totalAmount) " +
                "	FROM product q_p, transaction t, product_list pl " +
                "	WHERE q_p.productID = p.productID AND q_p.productID = pl.productID AND t.cartID = pl.cartID " +
                "	GROUP BY pl.productID) " +
                "ORDER BY salesTotal DESC;");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                data = "" + rs.getString("name") + DELIM + rs.getString("type") + DELIM + rs.getString("purchaseTotal") + DELIM +
                        rs.getString("salesTotal");
                
                accList.add(data);
            }
            
            return accList;
        } catch(SQLException e) {
            //put future audit codes here in the future
        }
        finally {
            try {
                pstmt.close();
                connection.close();
            } catch (SQLException ex) {
                // replace this in the future
                // what if the logger that logs fail itself? How can it log itself?
                Logger.getLogger(SecurityService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return null;
    }
    
    public static List<String> getTopCategorySales() {
        PreparedStatement pstmt = null;
        Connection connection = null;
        ResultSet rs = null;
        
        List<String> accList = new ArrayList<String>();
        String data = null;
        
        try {
            connection = DBPool.getInstance().getConnection();
            pstmt = connection.prepareStatement(
                "SELECT type, COUNT(datePurchased) * productQuantity AS purchaseTotal " +
                "FROM transaction t, product_list pl, product p, product_type pt " +
                "WHERE t.cartID = pl.cartID AND pl.productID = p.productID AND p.productTypeID = pt.typeID " +
                "GROUP BY type " +
                "ORDER BY purchaseTotal DESC " +
                "LIMIT 5;");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                data = "" + rs.getString("type") + DELIM + rs.getString("purchaseTotal");
                
                accList.add(data);
            }
            
            return accList;
        } catch(SQLException e) {
            //put future audit codes here in the future
        }
        finally {
            try {
                pstmt.close();
                connection.close();
            } catch (SQLException ex) {
                // replace this in the future
                // what if the logger that logs fail itself? How can it log itself?
                Logger.getLogger(SecurityService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return null;
    }
    
    //public static List<String> getYearlyCategorySales() {
        
    //}
}
