/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.security;

import edu.secprog.dto.UserEvent;
import java.sql.Timestamp;

/**
 *
 * @author CoRX
 */
public class Audit {
    
    public static final String INFOSTATUS = "Info";
    public static final String ERRORSTATUS = "Error";
    public static final String DEBUGSTATUS = "Debug";
    
    public static final String SQLEX = "Sql Exception";
    public static final String NULLPOINTEREX = "Null Pointer Exception";
    public static final String SERVLETEX = "Servlet Exception";
    public static final String IOEX = "IO Exception";
    
    public static Timestamp getCurrentTimeStamp() {
        Timestamp tstamp;
        tstamp = new Timestamp(System.currentTimeMillis());
        
        return tstamp;
    }
    
    // an event should contain the following: userID, Class: functionName(), raw content{<error code> [event title]: data}, alert type, timestamp
    // always copy this to different files: this.getClass().getEnclosingMethod().getName();
    // executed after checking at DB
    
    public static UserEvent getAuditLog(int userID, String alertType, String data) {
        StackTraceElement[] stElements = Thread.currentThread().getStackTrace();
        
        String classInstance = null;
        
        for (int i=1; i<stElements.length; i++) {
            StackTraceElement ste = stElements[i];
            if (!ste.getClassName().equals(Audit.class.getName()) 
                    && ste.getClassName().indexOf("java.lang.Thread") != 0)
                classInstance = ste.getClassName();
        }
        
        UserEvent ue = new UserEvent();
        
        if (!(userID > 0))
            userID = 0;
        
        ue.setUserID(userID);
        ue.setAlertType(alertType);
        ue.setServiceSource(classInstance);
        ue.setContent(data); // temporary until further notice
        ue.setTimestamp(getCurrentTimeStamp());
        
        return ue;
    }
    
    // might want to create http status code function here
    
}
