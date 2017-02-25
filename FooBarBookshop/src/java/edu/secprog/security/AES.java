/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.security;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
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
    
    public static byte[] encryptString(String key) {
        byte[] encrypted = null;
        
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
        
        return encrypted; // this may be null -- ensure that the calling function is enclosed with try-catch
    }
    
    public static String decryptString(byte[] key) {
        return null;
    }
}
