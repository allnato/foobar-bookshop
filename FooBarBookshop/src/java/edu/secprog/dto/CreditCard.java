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
public class CreditCard implements Serializable {
    
    public static String COLUMN_CREDITCARDID = "creditCardID";
    public static String COLUMN_NAME = "name";
    public static String COLUMN_CARDNUM = "cardNum";
    public static String COLUMN_TYPE = "cardNum";
    public static String COLUMN_EXPDATE = "expDate";
    
    private int creditCardID;
    private String name;
    private int cardNum;
    private String type;
    private String expDate;

    /**
     * @return the creditCardID
     */
    public int getCreditCardID() {
        return creditCardID;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the cardNum
     */
    public int getCardNum() {
        return cardNum;
    }

    /**
     * @param cardNum the cardNum to set
     */
    public void setCardNum(int cardNum) {
        this.cardNum = cardNum;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the expDate
     */
    public String getExpDate() {
        return expDate;
    }

    /**
     * @param expDate the expDate to set
     */
    public void setExpDate(String expDate) {
        this.expDate = expDate;
    }
    
    
    
}
