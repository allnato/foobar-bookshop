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
public class Review implements Serializable {
    
    public static String COLUMN_REVIEWID = "reviewID";
    public static String COLUMN_CUSTOMERID = "customerID";
    public static String COLUMN_RATING = "rating";
    public static String COLUMN_MESSAGE = "message";
    public static String COLUMN_DATEREVIEWED = "dateReviewed";
    
    private int reviewID;
    private int customerID;
    private int rating;
    private String message;
    private String dateReviewed;
    private String name;

    /**
     * @return the reviewID
     */
    public int getReviewID() {
        return reviewID;
    }

    /**
     * @param reviewID the reviewID to set
     */
    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    /**
     * @return the customerID
     */
    public int getCustomerID() {
        return customerID;
    }

    /**
     * @param customerID the customerID to set
     */
    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    /**
     * @return the rating
     */
    public int getRating() {
        return rating;
    }

    /**
     * @param rating the rating to set
     */
    public void setRating(int rating) {
        this.rating = rating;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the dateReviewed
     */
    public String getDateReviewed() {
        return dateReviewed;
    }

    /**
     * @param dateReviewed the dateReviewed to set
     */
    public void setDateReviewed(String dateReviewed) {
        this.dateReviewed = dateReviewed;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    
    
    
}
