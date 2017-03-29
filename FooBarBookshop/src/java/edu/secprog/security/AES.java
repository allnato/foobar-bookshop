/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author CoRX
 */
public class AES {
    
    public static byte[] setVector() { // used before encryption in registration / changing of password
    	  byte[] digestKey = new byte[16];
    	  MessageDigest sha = null;
    	  
    	  SecureRandom random = new SecureRandom();
          random.nextBytes(digestKey);
    	  
    	  try {
              sha = MessageDigest.getInstance("SHA-256");
              digestKey = sha.digest(digestKey);
              digestKey = Arrays.copyOf(digestKey, 16);
              
              return digestKey;
          } 
          catch (NoSuchAlgorithmException e) {
              e.printStackTrace();
          }
    	  
    	  return null;
      }
      
      public static byte[] encryptString(String key, byte[] initVector) {
    	  try {
    		  byte[] encrypted;
    		  
    		  AESEncrypter encrypter = new AESEncrypter(initVector);
    		  encrypted = encrypter.encrypt(key);
    		  
    		  return encrypted;
    		  
    	  } catch (Exception e) {
              e.printStackTrace();
          }
    	  
    	  return null;
      }
      
      public static String decryptString(byte[] key, byte[] initVector) {
    	  try {
    		  String decrypted;
    		  
    		  AESEncrypter encrypter = new AESEncrypter(initVector);
    		  decrypted = encrypter.decrypt(key);
    		  
    		  return decrypted;
    		  
    	  } catch (Exception e) {
              e.printStackTrace();
          }
    	  
    	  return null;
      }
      
    private static class AESEncrypter {
        Cipher ecipher;
        Cipher dcipher;

        AESEncrypter(byte[] digestKey) {
            try {
            	SecretKeySpec key = new SecretKeySpec(digestKey, "AES");
            	
                ecipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                dcipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                
                byte[] eiv = new byte[ecipher.getBlockSize()];
                byte[] div = new byte[dcipher.getBlockSize()];
                
                IvParameterSpec eivParams = new IvParameterSpec(eiv);
                IvParameterSpec divParams = new IvParameterSpec(div);
                
                ecipher.init(Cipher.ENCRYPT_MODE, key, eivParams);
                dcipher.init(Cipher.DECRYPT_MODE, key, divParams);

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        public byte[] encrypt(String str) {
            try {
                // Encode the string into bytes using utf-8
                byte[] utf8 = str.getBytes("UTF8");

                // Encrypt
                byte[] encrypted = null;
                try {
                    encrypted = ecipher.doFinal(utf8);
                } catch (IllegalBlockSizeException ex) {
                    ex.printStackTrace(); // soon log this on Audit
                }

                return encrypted;
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return null;
        }

        public String decrypt(byte[] key) {
            try {
                // Decrypt
                byte[] utf8 = dcipher.doFinal(key);

                // Decode using utf-8
                return new String(utf8, "UTF8");
            } catch (Exception ex) {
            	ex.printStackTrace();
            }
            return null;
        }
    }
}
