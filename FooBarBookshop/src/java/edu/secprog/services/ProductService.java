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
import java.sql.Statement;
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
                     product.setNoOfReviews(ProductService.getAllReviews(product.getProductID()).size());
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
                    product.setReviews(ProductService.getAllReviews(product.getProductID()));
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
    
    public static ArrayList<Review> getAllReviews(int productID) {
        ResultSet rs = null;
        ResultSet rs1;
         ArrayList<Review> reviews = new ArrayList();
         Review review;
        try {
            PreparedStatement pstmt;
            try (Connection connection = DBPool.getInstance().getConnection()) {
                pstmt = connection.prepareStatement("SELECT reviewID FROM product_reviews WHERE productID ='" + productID + "'");
                rs = pstmt.executeQuery();
                while(rs.next()) {
                    pstmt = connection.prepareStatement("SELECT * FROM review WHERE reviewID ='" + rs.getInt("reviewID") + "'");
                    rs1 = pstmt.executeQuery();
                    if(rs1.isBeforeFirst()) {
                        rs1.next();
                        review = new Review();
                        review.setCustomerID(rs1.getInt("customerID"));
                        review.setReviewID(rs1.getInt("reviewID"));
                        review.setDateReviewed(rs1.getString("dateReviewed"));
                        review.setMessage(rs1.getString("message"));
                        review.setRating(rs1.getInt("rating"));
                        review.setName(AccountService.getUsernameViaID(AccountService.getUserID(review.getCustomerID())));
                        reviews.add(review);
                    }
                }
                connection.close();
                rs.close();
                pstmt.close();
                return reviews;
                
            }
            
        }catch(SQLException e) {
            System.out.println("ANYARI HAHAHAHAAH LOL");
            e.printStackTrace();
        }
        
        // If everything fails, then:
        return reviews;
    }
   public static boolean addReview(Review review, int productID) {
       int reviewID;
       ResultSet rs = null;
       try {
            try (Connection connection = DBPool.getInstance().getConnection()) {
                PreparedStatement pstmt = connection.prepareStatement("INSERT INTO review(customerID, message, dateReviewed) values(?,?,?)", Statement.RETURN_GENERATED_KEYS);
                pstmt.setLong(1, review.getCustomerID());
                pstmt.setString(2, review.getMessage());
                pstmt.setString(3, review.getDateReviewed());
                pstmt.executeUpdate();
                rs = pstmt.getGeneratedKeys();
                if(rs.next()) {
                    reviewID = rs.getInt(1);
                    pstmt = connection.prepareStatement("INSERT INTO product_reviews(reviewID, productID) values(?,?)");
                    pstmt.setInt(1, reviewID);
                    pstmt.setInt(2, productID);
                    pstmt.executeUpdate();
                    
                }
                pstmt.close();
                connection.close();
                rs.close();
            } catch(Exception e){
                e.printStackTrace();
                return false;
            }

        }
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("Dami nanamang problem ano ba yan.");
            return false;
        }
       
       return true;
       
       
   }
        
}

