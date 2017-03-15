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
    
    public static void getAuditLog(int userID, String data) {
        
        int code;
        String classInstance, alertType;
        classInstance = Thread.currentThread().getStackTrace()[2].getClassName();
        
        alertType = getHttpStatusCode(data);
        
        UserEvent ue = new UserEvent();
        
        if (!(userID > 0))
            userID = 0;
        
        ue.setUserID(userID);
        ue.setAlertType(alertType);
        ue.setServiceSource(classInstance);
        ue.setContent(data);
        ue.setTimestamp(getCurrentTimeStamp());
        
        // check for log threats here
        SecurityService.addAuditLog(ue);
    }
    
    public static String getHttpStatusCode(String data) {
        int code = 0;
        String status = INFOSTATUS;
        
        switch(data) {
            case IOEX:
            case NULLPOINTEREX:
            case SERVLETEX:
            case SQLEX:
                code = 500;
                break;
        }
        
        if(code >= 200 && code <= 307)
            status = INFOSTATUS;
        else if(code >= 400 && code <= 505)
            status = ERRORSTATUS;
        else
            status = ERRORSTATUS;
        
        if(code != 0)
            return(status + ": " + code);
        
        return(status);
    }
    
}
