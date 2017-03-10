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
public class Transaction implements Serializable {
    
    public static String COLUMN_TRANSACTIONID = "transactionID";
    public static String COLUMN_CARTID = "cartID";
    public static String COLUMN_DATEPURCHASED = "datePurchased";
    public static String COLUMN_TOTALAMOUNT = "totalAmount";
    
    private int transactionID;
    private int cartID;
    private String datePurchased;
    private double totalAmount;

    /**
     * @return the transactionID
     */
    public int getTransactionID() {
        return transactionID;
    }

    /**
     * @param transactionID the transactionID to set
     */
    public void setTransactionID(int transactionID) {
        this.transactionID = transactionID;
    }

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
     * @return the datePurchased
     */
    public String getDatePurchased() {
        return datePurchased;
    }

    /**
     * @param datePurchased the datePurchased to set
     */
    public void setDatePurchased(String datePurchased) {
        this.datePurchased = datePurchased;
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
    
}
