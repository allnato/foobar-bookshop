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
public class UserEvent implements Serializable {
    
    public static String COLUMN_USERID = "userID";
    public static String COLUMN_ALERTTYPE = "alertType";
    public static String COLUMN_DESCRIPTION = "description";
    public static String COLUMN_DATETRIGGERED = "dateTriggered";
    
    private int userID;
    private String alertType;
    private String description;
    private String dateTriggered;

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
     * @return the alertType
     */
    public String getAlertType() {
        return alertType;
    }

    /**
     * @param alertType the alertType to set
     */
    public void setAlertType(String alertType) {
        this.alertType = alertType;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the dateTriggered
     */
    public String getDateTriggered() {
        return dateTriggered;
    }

    /**
     * @param dateTriggered the dateTriggered to set
     */
    public void setDateTriggered(String dateTriggered) {
        this.dateTriggered = dateTriggered;
    }
    
}
