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
public class CustomerCard implements Serializable {

    public static String COLUMN_CUSTOMERID = "customerID";
    public static String COLUMN_CREDITCARDID = "creditCardID";
    
    
    private int customerID;
    private int creditcardID;

    /**
     * @return the customerID
     */
    public int getCustomerID() {
        return customerID;
    }

    /**
     * @return the creditcardID
     */
    public int getCreditcardID() {
        return creditcardID;
    }
    
    
}
