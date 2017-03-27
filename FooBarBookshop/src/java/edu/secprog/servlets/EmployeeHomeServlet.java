/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.servlets;

import edu.secprog.security.Audit;
import edu.secprog.security.IDPair;
import edu.secprog.services.AccountService;
import edu.secprog.services.SecurityService;
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
@WebServlet(name = "EmployeeHomeServlet", urlPatterns = {"/employeeHome"})
public class EmployeeHomeServlet extends HttpServlet {

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
            boolean isLoggedIn = (boolean) session.getAttribute("qj123xf54");
            int userID = (int) session.getAttribute("l1k23h4");
            String role;

            role = SecurityService.blockEmployeeTraversal(userID);

            if(isLoggedIn) {
                if (role.equals("Administrator")) {
                    session.setAttribute("l1k23h4", userID);
                    request.getRequestDispatcher("admin-lock-accounts.jsp").forward(request, response);
                }
                else if (role.equals("Product Manager")) {
                    session.setAttribute("l1k23h4", userID);
                    request.getRequestDispatcher("pm-manage-products.jsp").forward(request, response);
                }
                else if (role.equals("Sales Manager")) {
                    session.setAttribute("l1k23h4", userID);
                    request.getRequestDispatcher("am-product-sales.jsp").forward(request, response);
                }
                else
                    response.sendError(Audit.BADINFO, "Invalid username or password or unauthorized access");
            }
            else
                response.sendError(Audit.UNAUTH);
        }
        catch (NullPointerException ex) {
            response.sendError(Audit.UNAUTH);
        }
        finally {
            // put the logging here
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
        HttpSession session = request.getSession();
        String role, username, password;
        int userID;
        IDPair result;
        
        username = request.getParameter("username");
        password = request.getParameter("password");
        
        result = AccountService.verifyPrivilege(username, password);
        userID = result.getID(); // try via getAttribute userID
        role = result.getValue();
        
        System.out.println(userID);
        System.out.println(role);
        
        if (role.equals("Administrator")) {
            session.setAttribute("l1k23h4", userID);
            session.setAttribute("qj123xf54", true);
            request.getRequestDispatcher("admin-lock-accounts.jsp").forward(request, response);
        }
        else if (role.equals("Product Manager")) {
            session.setAttribute("l1k23h4", userID);
            session.setAttribute("qj123xf54", true);
            request.getRequestDispatcher("pm-manage-products.jsp").forward(request, response);
        }
        else if (role.equals("Sales Manager")) {
            session.setAttribute("l1k23h4", userID);
            session.setAttribute("qj123xf54", true);
            request.getRequestDispatcher("am-product-sales.jsp").forward(request, response);
        }
        else
            response.sendError(Audit.BADINFO, "Invalid username or password or unauthorized access");
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
