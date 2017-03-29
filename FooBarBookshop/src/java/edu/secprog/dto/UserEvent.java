/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.dto;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author CoRX
 */
public class UserEvent implements Serializable {
    
    public static String COLUMN_EVENTID = "eventID";
    public static String COLUMN_USERID = "userID";
    public static String COLUMN_ALERTTYPE = "alertType";
    public static String COLUMN_SERVICESOURCE = "serviceSource";
    public static String COLUMN_CONTENT = "content";
    public static String COLUMN_TIMESTAMP = "timestamp";
    public static String COLUMN_RESPONSECODE = "responseCode";
    
    private int eventID;
    private int userID;
    private String alertType;
    private int responseCode;
    private String serviceSource;
    private String content;
    private Timestamp timestamp;

    /**
     * @return the eventID
     */
    public int getEventID() {
        return eventID;
    }

    /**
     * @param eventID the eventID to set
     */
    public void setEventID(int eventID) {
        this.eventID = eventID;
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
     * @return the serviceSource
     */
    public String getServiceSource() {
        return serviceSource;
    }

    /**
     * @param serviceSource the serviceSource to set
     */
    public void setServiceSource(String serviceSource) {
        this.serviceSource = serviceSource;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the timestamp
     */
    public Timestamp getTimestamp() {
        return timestamp;
    }

    /**
     * @param timestamp the timestamp to set
     */
    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    /**
     * @return the responseCode
     */
    public int getResponseCode() {
        return responseCode;
    }

    /**
     * @param responseCode the responseCode to set
     */
    public void setResponseCode(int responseCode) {
        this.responseCode = responseCode;
    }

    
}
