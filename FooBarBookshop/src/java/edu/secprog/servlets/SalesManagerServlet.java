/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.servlets;

import edu.secprog.security.Audit;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CoRX
 */
@WebServlet(name = "SalesManagerServlet", urlPatterns = {"/salesCategory", "/salesProduct", "/salesTotal"})
public class SalesManagerServlet extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        
        try {
            String action = request.getServletPath();

            boolean isLoggedIn = (boolean) session.getAttribute("qj123xf54");
            int userID = (int) session.getAttribute("l1k23h4");

            if (isLoggedIn) {
                switch(action) {
                    case "/salesCategory":
                        request.getRequestDispatcher("am-category-sales.jsp").forward(request, response);
                        break;
                    case "/salesProduct":
                        request.getRequestDispatcher("am-product-sales.jsp").forward(request, response);
                        break;
                    case "/salesTotal":
                        request.getRequestDispatcher("am-total-sales.jsp").forward(request, response);
                        break;
                    default:
                        response.sendError(Audit.SERVLETEX);
                }
            }
            else
                response.sendError(Audit.UNAUTH);
        }
        catch (NullPointerException ex) {
            response.sendError(Audit.UNAUTH);
        }
        finally {
            // error logging here
        }
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
