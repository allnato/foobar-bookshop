/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.security;

import edu.secprog.dto.UserEvent;
import edu.secprog.services.SecurityService;
import java.sql.Timestamp; 

/**
 *
 * @author CoRX
 */
public class Audit {
    
    private static final String INFOSTATUS = "Info";
    private static final String ERRORSTATUS = "Error";
    private static final String DEBUGSTATUS = "Debug";
    
    public static final int OKINFO = 200;
    public static final int BADINFO = 599;
    
    public static final int BADREQ = 400;
    public static final int UNAUTH = 403;
    public static final int NOTFOUND = 404;
    
    public static final int SQLEX = 598;
    public static final int NULLPOINTEREX = 597;
    public static final int SERVLETEX = 596;
    public static final int IOEX = 595;
    
    // public static final String SQLEX = "Sql Exception";
    // public static final String NULLPOINTEREX = "Null Pointer Exception";
    // public static final String SERVLETEX = "Servlet Exception";
    // public static final String IOEX = "IO Exception";
    
    public static Timestamp getCurrentTimeStamp() {
        Timestamp tstamp;
        tstamp = new Timestamp(System.currentTimeMillis());
        
        return tstamp;
    }
    
    // an event should contain the following: userID, Class: functionName(), raw content{<error code> [event title]: data}, alert type, timestamp
    // always copy this to different files: this.getClass().getEnclosingMethod().getName();
    // executed after checking at DB
    
    public static void getAuditLog(int userID, int responseCode) { // used especially on exceptions which has fixed msgs
        
        String classInstance, alertType, data;
        classInstance = Thread.currentThread().getStackTrace()[2].getClassName();
        
        data = getHttpStatusMsg(responseCode);
        
        if (data == null || data.trim().equals("")) // NEVER LOG RESPONSE CODE 200 WITH NO MESSAGE!
            return;
        
        UserEvent ue = new UserEvent();
        
        if (!(userID > 0))
            userID = 0;
        
        ue.setUserID(userID);
        
        if (responseCode >= 200 && responseCode < 300)
            alertType = INFOSTATUS;
        else if (responseCode < 0 || (responseCode >= 400 && responseCode < 600))
            alertType = ERRORSTATUS;
        else
            alertType = DEBUGSTATUS;
        
        ue.setAlertType(alertType);
        ue.setResponseCode(responseCode);
        ue.setServiceSource(classInstance);
        ue.setContent(data);
        ue.setTimestamp(getCurrentTimeStamp());
        
        // check for log threats here
        SecurityService.addAuditLog(ue);
    }
    
    public static void getAuditLog(int userID, int responseCode, String data) { // used on custom situations
        
        if (data == null || data.trim().equals(""))
            getAuditLog(userID, responseCode);
        
        String classInstance, alertType;
        classInstance = Thread.currentThread().getStackTrace()[2].getClassName();
        
        UserEvent ue = new UserEvent();
        
        if (!(userID > 0))
            userID = 0;
        
        ue.setUserID(userID);
        
        if (responseCode >= 200 && responseCode < 300)
            alertType = INFOSTATUS;
        else if (responseCode < 0 || (responseCode >= 400 && responseCode < 600))
            alertType = ERRORSTATUS;
        else
            alertType = DEBUGSTATUS;
        
        ue.setAlertType(alertType);
        ue.setResponseCode(responseCode);
        ue.setServiceSource(classInstance);
        ue.setContent(data);
        ue.setTimestamp(getCurrentTimeStamp());
        
        // check for log threats here
        SecurityService.addAuditLog(ue);
    }
    
    public static String getHttpStatusMsg(int responseCode) {
        
        String data = null;
        
        switch(responseCode) {
            case BADREQ:
                data = "Bad Request";
                break;
            case UNAUTH:
                data = "Unauthorized Access";
                break;
            case NOTFOUND:
                data = "Page Not Found";
                break;
            case IOEX:
                data = "IO Exception";
                break;
            case NULLPOINTEREX:
                data = "Null Pointer Exception";
                break;
            case SERVLETEX:
                data = "Servlet Exception";
                break;
            case SQLEX:
                data = "SQL Exception";
                break;
        }
        
        return data;
    }
    
}
