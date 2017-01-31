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
public class Customer extends Account implements Serializable {
    public static String COLUMN_CUSTOMERID = "customerID";
    public static String COLUMN_DATEREGISTERED = "dateRegistered";
    
    private int customerID;
    private String dateRegistered;

    /**
     * @return the customerID
     */
    public int getCustomerID() {
        return customerID;
    }

    /**
     * @return the dateRegistered
     */
    public String getDateRegistered() {
        return dateRegistered;
    }

    /**
     * @param dateRegistered the dateRegistered to set
     */
    public void setDateRegistered(String dateRegistered) {
        this.dateRegistered = dateRegistered;
    }
    
    
    
    
}
