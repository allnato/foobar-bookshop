/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.dto;

import java.io.Serializable;

/**
 *
 * @author CoRX
 */
public class Cart implements Serializable {
    public static String COLUMN_CARTID = "cartID";
    public static String COLUMN_CUSTOMERID = "customerID";
    public static String COLUMN_TOTALQUANTITY = "totalQuantity";
    public static String COLUMN_TOTALAMOUNT = "totalAmount";
    public static String COLUMN_STATUS = "status";
    
    private int cartID;
    private int customerID;
    private int totalQuantity;
    private double totalAmount;
    private String status;

    /**
     * @return the cartID
     */
    public int getCartID() {
        return cartID;
    }

    /**
     * @param cartID the cartID to set
     */
    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    /**
     * @return the customerID
     */
    public int getCustomerID() {
        return customerID;
    }

    /**
     * @param customerID the customerID to set
     */
    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    /**
     * @return the totalQuantity
     */
    public int getTotalQuantity() {
        return totalQuantity;
    }

    /**
     * @param totalQuantity the totalQuantity to set
     */
    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    /**
     * @return the totalAmount
     */
    public double getTotalAmount() {
        return totalAmount;
    }

    /**
     * @param totalAmount the totalAmount to set
     */
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }
}
