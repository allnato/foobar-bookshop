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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
            PreparedStatement pstmt = connection.prepareStatement("SELECT status FROM users"
                    + " WHERE username= '" + username + "' AND password= '" + password +  "';");
            rs = pstmt.executeQuery();
            if(rs.isBeforeFirst()) {
                connection.close();
                pstmt.close();
                return true;
            }
            return false;
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    public static boolean registerUser(Customer nc, CustomerAddress bca, CustomerAddress dca, CreditCard cc) {
        
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO users(firstname, lastname,"
                    + "middleinitial,birthdate,email,username,password,status) values("
                    + "?,?,?,?,?,?,?,?)");
            pstmt.setString(1, nc.getFirstname());
            pstmt.setString(2, nc.getLastname());
            pstmt.setString(3, nc.getMiddleinitial());
            pstmt.setString(4, nc.getBirthdate());
            pstmt.setString(5, nc.getEmail());
            pstmt.setString(6, nc.getUsername());
            pstmt.setString(7, nc.getPassword());;
            pstmt.setString(8, nc.getStatus());
            
        } catch(Exception e) {
            e.printStackTrace();
        }
                
        return false;
    }
    
}
