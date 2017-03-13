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
public class Password implements Serializable {
    
    public static String COLUMN_PASSID = "passID";
    public static String COLUMN_HASHED = "hashed";
    public static String COLUMN_ENCRYPTED = "encrypted";
    public static String COLUMN_VECTOR = "vector";
    public static String COLUMN_TIMESTAMP = "timestamp";
    public static String COLUMN_USERID = "userID";
    
    private int passID;
    private String hashed;
    private byte[] encrypted;
    private byte[] vector;
    private String timestamp;
    private int userID;

    /**
     * @return the passID
     */
    public int getPassID() {
        return passID;
    }

    /**
     * @param passID the passID to set
     */
    public void setPassID(int passID) {
        this.passID = passID;
    }

    /**
     * @return the hashed
     */
    public String getHashed() {
        return hashed;
    }

    /**
     * @param hashed the hashed to set
     */
    public void setHashed(String hashed) {
        this.hashed = hashed;
    }

    /**
     * @return the encrypted
     */
    public byte[] getEncrypted() {
        return encrypted;
    }

    /**
     * @param encrypted the encrypted to set
     */
    public void setEncrypted(byte[] encrypted) {
        this.encrypted = encrypted;
    }

    /**
     * @return the vector
     */
    public byte[] getVector() {
        return vector;
    }

    /**
     * @param vector the vector to set
     */
    public void setVector(byte[] vector) {
        this.vector = vector;
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
    
}
