/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.servlets;

import edu.secprog.security.AES;
import edu.secprog.security.Audit;
import edu.secprog.security.IDPair;
import edu.secprog.services.AccountService;
import edu.secprog.services.MailService;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
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
@WebServlet(urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        boolean failState = true;
        int userID = 0;
        
        try {
            HttpSession session = request.getSession(false);
            boolean isLoggedIn, isLocked;
            long lockedTime;
            IDPair result;
            String status;
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            //String[] rec = { "dlsu.sachii@gmail.com" };
            //MailService.sendFromGmail(MailService.USER_NAME, MailService.PASSWORD, rec , "Hallo *salute*", "Grabe grabe grabe");
            result = AccountService.verifyExists(username, password);
            userID = result.getID();
            status = result.getValue();
            
            if(status.equals("active")) {
                System.out.println("Uy naglogin haha");
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }
            else if(status.equals("banned")) {
                System.out.println("I'm locked patulong pls :( ");
            }
            else {
                System.out.println("bes what happened");
            }
            
            failState = true;
        }
        catch (ServletException e) {
            Audit.getAuditLog(userID, Audit.SERVLETEX);
        }
        catch (IOException e) {
            Audit.getAuditLog(userID, Audit.IOEX);
        }
        finally {
            // add finally statements later
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
