/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.services;

import edu.secprog.db.DBPool;
import edu.secprog.dto.Product;
import edu.secprog.dto.Review;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mark Christian Sanchez
 */
public class ProductService {
    
    
    public static ArrayList<Product> getAllProducts() {
         ResultSet rs = null;
         ArrayList<Product> products = new ArrayList();
         Product product;
        try {
            PreparedStatement pstmt;
            try (Connection connection = DBPool.getInstance().getConnection()) {
                pstmt = connection.prepareStatement("SELECT * FROM product");
                rs = pstmt.executeQuery();
                while(rs.next()) {
                     product = new Product();
                     product.setProductID(rs.getInt("productID"));
                     product.setName(rs.getString("name"));
                     product.setDescription(rs.getString("description"));
                     product.setPrice(rs.getDouble("price"));
                     product.setAvgRating(rs.getDouble("avgRating"));
                     products.add(product);
                }
                connection.close();
                rs.close();
                pstmt.close();
                return products;
            }
            
        }catch(SQLException e) {
            System.out.println("ANYARI HAHAHAHAAH LOL");
            e.printStackTrace();
        }
        
        // If everything fails, then:
        return null;
    }
    
    public static Product getProduct(String productID) {
        
        ResultSet rs = null;
      
        Product product;
        try {
            PreparedStatement pstmt;
            try (Connection connection = DBPool.getInstance().getConnection()) {
                pstmt = connection.prepareStatement("SELECT * FROM product WHERE productID='" + productID + "'");
                rs = pstmt.executeQuery();
                if(rs.isBeforeFirst()) {
                    rs.next();
                    product = new Product();
                    product.setProductID(rs.getInt("productID"));
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setAvgRating(rs.getDouble("avgRating"));
                    connection.close();
                    rs.close();
                    pstmt.close();
                    return product;
                }
            }
            
        }catch(SQLException e) {
            System.out.println("ANYARI HAHAHAHAAH LOL");
            e.printStackTrace();
        }
        
        // If everything fails, then:
        return null;
    }
    
    public static ArrayList<Review> getAllReviews(String productID) {
        ResultSet rs = null;
         ArrayList<Review> reviews = new ArrayList();
         Review review;
        try {
            PreparedStatement pstmt;
            try (Connection connection = DBPool.getInstance().getConnection()) {
                pstmt = connection.prepareStatement("SELECT reviewID FROM product_reviews WHERE productID ='" + productID + "'");
                rs = pstmt.executeQuery();
                while(rs.next()) {
                     
                }
                connection.close();
                rs.close();
                pstmt.close();
                
            }
            
        }catch(SQLException e) {
            System.out.println("ANYARI HAHAHAHAAH LOL");
            e.printStackTrace();
        }
        
        // If everything fails, then:
        return null;
    }
}
