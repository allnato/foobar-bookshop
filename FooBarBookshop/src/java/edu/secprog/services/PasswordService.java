/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.services;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.util.Date;

/**
 *
 * @author Mark Christian Sanchez
 */
public class PasswordService {
    String jwt = Jwts.builder()
  .setSubject("users/TzMUocMF4p")
  .setExpiration(new Date(1300819380))
  .claim("name", "Robert Token Man")
  .claim("scope", "self groups/admins")
  .signWith(
    SignatureAlgorithm.HS256,
    "secret".getBytes("UTF-8")
  )
  .compact();
}
