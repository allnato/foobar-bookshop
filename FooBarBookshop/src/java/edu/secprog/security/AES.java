/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.security;

import edu.secprog.dto.Customer;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;

/**
 *
 * @author CoRX
 */
public class AES {
    
    private static IvParameterSpec ivParameterSpec;
    
    // here, it is expected that there's a password entry already
    public static void encryptString(String key, Customer nc) {
        byte[] encrypted = null;
        ResultSet rs = null;
        
        KeyGenerator KeyGen = null;
        try {
            KeyGen = KeyGenerator.getInstance("AES");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(AES.class.getName()).log(Level.SEVERE, null, ex);
        }
        KeyGen.init(256);
        
        SecretKey SecKey = KeyGen.generateKey();
        Cipher AesCipher = null;
        try {
            AesCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        } catch (NoSuchAlgorithmException | NoSuchPaddingException ex) {
            Logger.getLogger(AES.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        byte[] keyByte = key.getBytes();
        byte[] initVec = new byte[16];
        
        SecureRandom random = new SecureRandom();
        random.nextBytes(initVec);
        ivParameterSpec = new IvParameterSpec(initVec);
        
        try {
            AesCipher.init(Cipher.ENCRYPT_MODE, SecKey, ivParameterSpec);
        } catch (InvalidKeyException | InvalidAlgorithmParameterException ex) {
            Logger.getLogger(AES.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            encrypted = AesCipher.doFinal(keyByte);
        } catch (IllegalBlockSizeException | BadPaddingException ex) {
            Logger.getLogger(AES.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(encrypted != null && encrypted.length != 0) {
        
            long insertID = -1;
            PreparedStatement pstmt = null;
            Connection connection = null;
            
            /* Step 1: Add the data to the user table, regardless if employee or customer
             */
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/foobar_booksop", "test", "1234");
                pstmt = connection.prepareStatement("INSERT INTO passwords(encrypted, vector"
                        + ",timestamp) values(?,?,?)", Statement.RETURN_GENERATED_KEYS);
                pstmt.setBytes(1, encrypted);
                pstmt.setBytes(2, initVec);
                pstmt.setTimestamp(3, Audit.getCurrentTimeStamp());
                int affectedRows = pstmt.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Register failed! No rows affected");
                }
                // Check if registering is successful. Return ID generated
                try {
                    rs = pstmt.getGeneratedKeys();
                    if(rs.next()) {
                        insertID = rs.getLong(1);
                    }
                    else {
                        throw new SQLException("Register failed! No rows affected");
                    }
                } catch(SQLException e) {
                    System.out.println("Register failed! No rows affected");
                    }
                // End CHeck if registering is successful
            } catch(ClassNotFoundException | SQLException e) {
                //put future audit codes here in the future
                }
            finally {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AES.class.getName()).log(Level.SEVERE, null, ex);
                }
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AES.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    public static String decryptString(byte[] key) {
        return null;
    }
}
