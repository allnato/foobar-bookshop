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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        IDPair result;
        int userID = 0;
        String status;
        int responseCode = 200;
        String msgDesc = null;
            
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            //String[] rec = { "dlsu.sachii@gmail.com" };
            //MailService.sendFromGmail(MailService.USER_NAME, MailService.PASSWORD, rec , "Hallo *salute*", "Grabe grabe grabe");
            result = AccountService.verifyExists(username, password);
            userID = result.getID();
            status = result.getValue();
            System.out.println(status);
            
            if(status.equals("active")) {
                System.out.println("Uy naglogin haha");
                responseCode = Audit.OKINFO;
                msgDesc = "Successful user log in";
                
                request.getRequestDispatcher("user-profile.jsp").forward(request, response);
            }
            else if(status.equals("banned")) {
                System.out.println("I'm locked patulong pls :( ");
                responseCode = Audit.BADINFO;
                msgDesc = "Invalid username or password";
                
                response.sendError(Audit.BADINFO, msgDesc);
            }
            else {
                System.out.println("bes what happened");
                responseCode = Audit.BADINFO;
                msgDesc = "Invalid username or password";
                
                response.sendError(Audit.BADINFO, msgDesc);
            }

        }
        catch (ServletException e) {
            responseCode = Audit.SERVLETEX;
            response.sendError(responseCode, Audit.getHttpStatusMsg(responseCode));
        }
        catch (IOException e) {
            responseCode = Audit.IOEX;
            response.sendError(responseCode, Audit.getHttpStatusMsg(responseCode));
        }
        finally {
            Audit.getAuditLog(userID, responseCode, msgDesc);
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
