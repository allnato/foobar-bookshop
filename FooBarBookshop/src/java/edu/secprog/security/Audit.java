/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.security;

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
}
