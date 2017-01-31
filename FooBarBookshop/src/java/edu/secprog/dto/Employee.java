/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.dto;

import java.io.Serializable;

/**
 *
 * @author Mark Christian Sanchez
 */
public class Employee extends Account implements Serializable {
    
    public static String COLUMN_EMPLOYEEID = "employeeID";
    public static String COLUMN_DATEHIRED = "dateHired";
    public static String COLUMN_EMPLOYEETYPE = "employeeType";
    
    private int employeeID;
    private String dateHired;
    private String employeeType;

    /**
     * @return the employeeID
     */
    public int getEmployeeID() {
        return employeeID;
    }

    /**
     * @return the dateHired
     */
    public String getDateHired() {
        return dateHired;
    }

    /**
     * @param dateHired the dateHired to set
     */
    public void setDateHired(String dateHired) {
        this.dateHired = dateHired;
    }

    /**
     * @return the employeeType
     */
    public String getEmployeeType() {
        return employeeType;
    }

    /**
     * @param employeeType the employeeType to set
     */
    public void setEmployeeType(String employeeType) {
        this.employeeType = employeeType;
    }
    
    
}
