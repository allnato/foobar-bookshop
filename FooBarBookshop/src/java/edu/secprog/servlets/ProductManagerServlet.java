/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.servlets;

import edu.secprog.security.Audit;
import edu.secprog.services.EmployeeService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "ProductManagerServlet", urlPatterns = {"/manageProducts"})
public class ProductManagerServlet extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        int responseCode = Audit.OKINFO;
        int userID = 0;
        List<String> prodList;
        String category;
        
        try {
            String action = request.getServletPath();

            boolean isLoggedIn = (boolean) session.getAttribute("qj123xf54");
            userID = (int) session.getAttribute("l1k23h4");

            if (isLoggedIn) {
                switch(action) {
                    case "/manageProducts":
                        category = EmployeeService.getProductCategory(userID);
                        prodList = EmployeeService.getProductList(category);
                        
                        System.out.println(category);
                        
                        request.setAttribute("prodList", prodList);
                        request.getRequestDispatcher("pm-manage-products.jsp").forward(request, response);
                        break;
                    default:
                        responseCode = Audit.SERVLETEX;
                        response.sendError(responseCode, Audit.getHttpStatusMsg(responseCode));
                }
            }
            else {
                responseCode = Audit.UNAUTH;
                response.sendError(responseCode);
            }
        }
        catch (NullPointerException ex) {
            responseCode = Audit.UNAUTH;
            response.sendError(responseCode);
        }
        catch (ServletException ex) {
            responseCode = Audit.SERVLETEX;
            response.sendError(responseCode);
        }
        finally {
            if (responseCode != Audit.OKINFO)
                Audit.getAuditLog(userID, responseCode);
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
