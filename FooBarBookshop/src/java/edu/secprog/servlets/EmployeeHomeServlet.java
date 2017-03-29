/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.servlets;

import edu.secprog.security.Audit;
import edu.secprog.security.IDPair;
import edu.secprog.services.AccountService;
import edu.secprog.services.EmployeeService;
import edu.secprog.services.SecurityService;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        int responseCode = Audit.OKINFO;
        int userID = 0;
        String msgDesc = null;
        
        try {
            boolean isLoggedIn = (boolean) session.getAttribute("qj123xf54");
            userID = (int) session.getAttribute("l1k23h4");
            String role;

            role = SecurityService.blockEmployeeTraversal(userID);

            if(isLoggedIn) {
                System.out.println("my role is " + role);
                if (role.equals("Administrator")) {
                    session.setAttribute("l1k23h4", userID);
                    
                    List<String> accList = EmployeeService.getLockAccounts();
                    request.setAttribute("accList", accList);
                    request.getRequestDispatcher("adminLock").forward(request, response);
                }
                else if (role.equals("Product Manager")) {
                    session.setAttribute("l1k23h4", userID);
                    
                    String category = EmployeeService.getProductCategory(userID);
                    List<String> prodList = EmployeeService.getProductList(category);
                        
                    request.setAttribute("prodList", prodList);
                    request.getRequestDispatcher("manageProducts").forward(request, response);
                }
                else if (role.equals("Sales Manager")) {
                    session.setAttribute("l1k23h4", userID);
                    request.getRequestDispatcher("salesProduct").forward(request, response);
                }
                else {
                    responseCode = Audit.BADINFO;
                    msgDesc = "Invalid username or password or unauthorized access";
                    
                    response.sendError(Audit.BADINFO, msgDesc);
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
                Audit.getAuditLog(userID, responseCode, msgDesc);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String role, username, password;
        int userID = 0;
        IDPair result;
        int responseCode = Audit.OKINFO;
        String msgDesc = null;
        
        try {
            username = request.getParameter("username");
            password = request.getParameter("password");

            result = AccountService.verifyPrivilege(username, password);
            userID = result.getID();
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
            else {
                responseCode = Audit.BADINFO;
                msgDesc = "Invalid username or password or unauthorized access";
                    
                response.sendError(Audit.BADINFO, msgDesc);
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
