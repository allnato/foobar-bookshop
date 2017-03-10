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
public class Logins implements Serializable {
    
    public static String COLUMN_LOGINID = "loginID";
    public static String COLUMN_USERID = "userID";
    public static String COLUMN_STATUS = "status";
    public static String COLUMN_TIMESTAMP = "timestamp";
    
    private int loginID;
    private int userID;
    private String status;
    private String timestamp;

    /**
     * @return the loginID
     */
    public int getLoginID() {
        return loginID;
    }

    /**
     * @param loginID the loginID to set
     */
    public void setLoginID(int loginID) {
        this.loginID = loginID;
    }

    /**
     * @return the userID
     */
    public int getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(int userID) {
        this.userID = userID;
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

    /**
     * @return the timestamp
     */
    public String getTimestamp() {
        return timestamp;
    }

    /**
     * @param timestamp the timestamp to set
     */
    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
    
    

  
    
    
}
