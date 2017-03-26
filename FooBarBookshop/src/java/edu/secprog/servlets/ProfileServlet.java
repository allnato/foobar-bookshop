/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.servlets;

import edu.secprog.dto.CustomerAddress;
import edu.secprog.dto.User;
import edu.secprog.services.AccountService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mark Christian Sanchez
 */
@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {

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
        
        
            HttpSession session = request.getSession();
            System.out.println("Nagload yung ProfileServlet mga bes");
            User currUser = AccountService.getUserInfo((Integer)session.getAttribute("userID"));
            request.setAttribute("firstName", currUser.getFirstname());
            request.setAttribute("lastName", currUser.getLastname());
            request.setAttribute("middleInitial", currUser.getMiddleinitial());
            request.setAttribute("birthDate", currUser.getBirthdate());
            request.setAttribute("userName", currUser.getUsername());
            
            
            int customerID = AccountService.getCustomerID((Integer)session.getAttribute("userID"));
            CustomerAddress bAddr = AccountService.getBillingAddress(customerID);
            CustomerAddress dAddr = AccountService.getDeliveryAddress(customerID);
            // Billing Address
            request.setAttribute("bAddressType", bAddr.getAddressType());
            request.setAttribute("bAddress", bAddr.getAddress());
            request.setAttribute("bCity", bAddr.getCity());
            request.setAttribute("bZipcode", bAddr.getZipcode());
            request.setAttribute("bRegion", bAddr.getRegion());
            request.setAttribute("bCountry", bAddr.getCountry());
            // Delivery Address
            request.setAttribute("dAddressType", dAddr.getAddressType());
            request.setAttribute("dAddress", dAddr.getAddress());
            request.setAttribute("dCity", dAddr.getCity());
            request.setAttribute("dZipcode", dAddr.getZipcode());
            request.setAttribute("dRegion", dAddr.getRegion());
            request.setAttribute("dCountry", dAddr.getCountry());
            
            request.getRequestDispatcher("user-profile.jsp").forward(request, response);
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
