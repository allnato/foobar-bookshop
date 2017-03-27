/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.servlets;

import edu.secprog.dto.Password;
import edu.secprog.security.AES;
import edu.secprog.security.Audit;
import edu.secprog.security.BCrypt;
import edu.secprog.security.IDPair;
import edu.secprog.services.AccountService;
import edu.secprog.services.PasswordService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mark Christian Sanchez
 */
public class UpdatePasswordServlet extends HttpServlet {


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
           
        int userID = (Integer)request.getSession().getAttribute("userID");
        
        String password = request.getParameter("old_password");
        String username = AccountService.getUsernameViaID(userID);
        IDPair idpair = AccountService.verifyExists(username, password);
        String status = idpair.getValue();
        System.out.println("UPS username: " + username);
        System.out.println("UPS Status: " + status);
        System.out.println("UPS CurrPass: " + password);
        HttpSession session = request.getSession();
        if(status.equals("active")) {
            System.out.println("Successful password change");
            Password ps = new Password();
            byte[] vector = AES.setVector();
            ps.setHashed(BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt(10)));
            ps.setEncrypted(AES.encryptString(request.getParameter("password"), vector));
            ps.setVector(vector);
            ps.setTimestamp(Audit.getCurrentTimeStamp());
            ps.setUserID(userID);
            PasswordService.updatePassword(ps);
            session.invalidate();
            request.getRequestDispatcher("main-login-page.jsp").forward(request, response);
            
        }
        else {
           System.out.println("Unsuccessful password change"); 
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
