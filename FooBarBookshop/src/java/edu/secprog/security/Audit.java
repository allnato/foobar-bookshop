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
    
    public static Timestamp getCurrentTimeStamp() {
        Timestamp tstamp;
        tstamp = new Timestamp(System.currentTimeMillis());
        
        return tstamp;
    }
    
    // an event should contain the following: userID, Class: functionName(), raw content{<error code> [event title]: data}, alert type, timestamp
    
    public static UserEvent getErrorAudit(String message, String stackTrace) {
        UserEvent ue = new UserEvent();
        
        return ue;
    }
    
    public static int classifyHTTPCode() {
        return -1;
    }
}
