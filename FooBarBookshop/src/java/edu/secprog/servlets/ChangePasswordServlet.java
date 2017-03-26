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
import edu.secprog.services.PasswordService;
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
@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/updatePassword"})
public class ChangePasswordServlet extends HttpServlet {

 


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
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Password ps = new Password();
        byte[] vector;
        int userID = 0;
        int responseCode = 200;
        String msgDesc = null;

        try {
            HttpSession session = request.getSession();
            userID = (int) session.getAttribute("luxdi");
            vector = AES.setVector();

            ps.setHashed(BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt(10)));
            ps.setEncrypted(AES.encryptString(request.getParameter("password"), vector));
            ps.setVector(vector);
            ps.setTimestamp(Audit.getCurrentTimeStamp());

            PasswordService.updatePassword(ps);
            session.invalidate();

            responseCode = Audit.OKINFO;
            msgDesc = "Password Change Successful";
            
            request.getRequestDispatcher("main-login-page.jsp").forward(request, response);
        }
        catch (ServletException e) {
            responseCode = Audit.SERVLETEX;
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
