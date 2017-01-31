package edu.secprog.dto;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Beep xD
 */
public abstract class Account {
    
    public static String TABLE_NAME = "users";
    public static String COLUMN_ID = "userID";
    public static String COLUMN_EMAIL = "email";
    public static String COLUMN_PASSWORD = "password";
    public static String COLUMN_FIRSTNAME = "firstname";
    public static String COLUMN_LASTNAME = "lastname";
    public static String COLUMN_MIDDLEINITIAL = "middleinitial";
    public static String COLUMN_BIRTHDATE = "birthdate";
    public static String COLUMN_STATUS = "status";
    public static String COLUMN_USERNAME = "username";
 
    private int userID;
    private String firstname;
    private String lastname;
    private String middleinitial;
    private String birthdate;
    private String email;
    private String username;
    private String password;
    private String status;

    /**
     * @return the userID
     */
    public int getUserID() {
        return userID;
    }

    /**
     * @return the firstname
     */
    public String getFirstname() {
        return firstname;
    }

    /**
     * @param firstname the firstname to set
     */
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    /**
     * @return the lastname
     */
    public String getLastname() {
        return lastname;
    }

    /**
     * @param lastname the lastname to set
     */
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    /**
     * @return the middleinitial
     */
    public String getMiddleinitial() {
        return middleinitial;
    }

    /**
     * @param middleinitial the middleinitial to set
     */
    public void setMiddleinitial(String middleinitial) {
        this.middleinitial = middleinitial;
    }

    /**
     * @return the birthdate
     */
    public String getBirthdate() {
        return birthdate;
    }

    /**
     * @param birthdate the birthdate to set
     */
    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
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
    
    
}