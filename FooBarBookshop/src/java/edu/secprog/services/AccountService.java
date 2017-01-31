 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.services;

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
            Class.forName("com.mysql.jdbc.driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
            PreparedStatement pstmt = connection.prepareStatement("SELECT firstname FROM users;");
            rs = pstmt.executeQuery();
            while(rs.next()) {
               Employee e = new Employee();
               e.setFirstname(rs.getString(Employee.COLUMN_FIRSTNAME));
               employeeList.add(e);
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        return employeeList;
    }
    
}
