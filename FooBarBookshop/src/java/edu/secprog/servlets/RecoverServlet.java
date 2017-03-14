/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.servlets;

import edu.secprog.services.PasswordService;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;
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
@WebServlet(name = "RecoverServlet", urlPatterns = {"/recover"})
public class RecoverServlet extends HttpServlet {


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
        
        String token = request.getParameter("token");
        String userID = request.getParameter("uid");
        UUID uuid = UUID.fromString(token);
        Date timestamp = PasswordService.DateFromUUID(uuid);
        Date now = new Date();
        if( (now.getTime() - timestamp.getTime()) > 3600000) {
            // Token has expired
            System.out.println("Expired na");
            request.getRequestDispatcher("expired.jsp").forward(request, response);
        }
        else {
            // Check if the token matches
            System.out.println("Pasado yung token bes");
            if(PasswordService.checkValidityOfToken(userID, token)) {
                HttpSession session = request.getSession();
                session.setAttribute("luxdi", userID);
                request.getRequestDispatcher("new_password.jsp").forward(request, response);
            }
            else {
                request.getRequestDispatcher("404.jsp").forward(request, response);
            }
        }

    }


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
