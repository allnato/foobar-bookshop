/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.dto;

import java.io.Serializable;

/**
 *
 * @author Mark Christian Sanchez
 */
public class Product implements Serializable {
    
    public static String COLUMN_PRODUCTID = "productID";
    public static String COLUMN_NAME = "name";
    public static String COLUMN_DESCRIPTION = "description";
    public static String COLUMN_PRICE = "price";
    public static String COLUMN_AVGRATING = "avgRating";
    
    private int productID;
    private String name;
    private String description;
    private double price;
    private double avgRating;

    /**
     * @return the productID
     */
    public int getProductID() {
        return productID;
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
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * @return the avgRating
     */
    public double getAvgRating() {
        return avgRating;
    }

    /**
     * @param avgRating the avgRating to set
     */
    public void setAvgRating(double avgRating) {
        this.avgRating = avgRating;
    }
    
    
}
