/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.servlets;

import edu.secprog.dto.CreditCard;
import edu.secprog.dto.Customer;
import edu.secprog.dto.CustomerAddress;
import edu.secprog.dto.Password;
import edu.secprog.security.AES;
import edu.secprog.security.Audit;
import edu.secprog.security.BCrypt;
import edu.secprog.services.AccountService;
import edu.secprog.services.SecurityService;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mark Christian Sanchez
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean isSuccessful;
        Customer nc = new Customer();
        CustomerAddress bca = new CustomerAddress();
        CustomerAddress dca = new CustomerAddress();
        CreditCard cc = new CreditCard();
        Password ps = new Password();
        
        // Set user information
        nc.setFirstname(request.getParameter("firstName"));
        nc.setMiddleinitial(request.getParameter("middleInitial"));
        nc.setLastname(request.getParameter("lastName"));
        nc.setEmail(BCrypt.hashpw(request.getParameter("email"), BCrypt.gensalt(10)));
        Date birthDate = null;
        SimpleDateFormat sdf0 =
            new SimpleDateFormat("yyyy-MM-dd");
        try {
            birthDate = sdf0.parse(request.getParameter("birthDate"));
        } catch (ParseException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        java.sql.Date sqlBirthDate = new java.sql.Date(birthDate.getTime());
 
        nc.setBirthdate(sqlBirthDate.toString());
        nc.setUsername(request.getParameter("username"));
        nc.setPassword(BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt(10)));
        nc.setStatus("active");
        Date dt = new Date();
        SimpleDateFormat sdf =
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateRegistered = sdf.format(dt);
        nc.setDateRegistered(dateRegistered);
        // Set user address on a different object and table
        // Billing Address
        System.out.println(request.getParameter("b_address"));
        System.out.println(request.getParameter("b_city"));
        
        bca.setAddress(request.getParameter("b_address"));
        bca.setCity(request.getParameter("b_city"));
        bca.setZipcode(request.getParameter("b_zipcode"));
        bca.setRegion(request.getParameter("b_region"));
        bca.setCountry(request.getParameter("b_country"));
        bca.setAddressType("billing");
        // Delivery Debugging Purposes
        System.out.println("Delivery Address");
        System.out.println(bca.getAddress());
        System.out.println(bca.getCity());
        System.out.println(bca.getZipcode());
        System.out.println(bca.getRegion());
        System.out.println(bca.getCountry());
        System.out.println(bca.getAddressType());
        System.out.println(bca.getAddressType());
        // Shipping Address
        dca.setAddress(request.getParameter("d_address"));
        dca.setCity(request.getParameter("d_city"));
        dca.setZipcode(request.getParameter("d_zipcode"));
        dca.setRegion(request.getParameter("d_region"));
        dca.setCountry(request.getParameter("d_country"));
        dca.setAddressType("delivery");
        // Delivery Debugging Purposes
        System.out.println("Delivery Address");
        System.out.println(dca.getAddress());
        System.out.println(dca.getCity());
        System.out.println(dca.getZipcode());
        System.out.println(dca.getRegion());
        System.out.println(dca.getCountry());
        System.out.println(dca.getAddressType());
        
        // Set user credit card info
        cc.setName(request.getParameter("cardName"));
        cc.setCardNum(BCrypt.hashpw(request.getParameter("cardNum"), BCrypt.gensalt(10)));
        cc.setType(request.getParameter("cardType"));
        cc.setExpDate(request.getParameter("cardExp"));
        System.out.println("YUNG CARD TYPE: " + request.getParameter("cardType"));
        
        try {
            isSuccessful = AccountService.registerUser(nc,bca,dca,cc);
            System.out.println("SUCCESSFUL BA BES?" + isSuccessful);
            if (isSuccessful) {
                // Set password
                int userID;
                byte[] vector;
                vector = AES.setVector();

                ps.setHashed(BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt(10)));
                ps.setEncrypted(AES.encryptString(request.getParameter("password"), vector));
                ps.setVector(vector);
                ps.setTimestamp(Audit.getCurrentTimeStamp());
                
                userID = SecurityService.getPassOwner(request.getParameter("username"));
                if(userID > 0) {
                    ps.setUserID(userID);
                    SecurityService.addPassword(ps);
                    request.getRequestDispatcher("main-login-page.jsp").forward(request, response);
                }
            }
            
            // add else if registration is not successful
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
