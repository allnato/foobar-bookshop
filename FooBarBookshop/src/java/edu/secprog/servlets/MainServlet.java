package edu.secprog.servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import edu.secprog.dto.Employee;
import edu.secprog.security.Audit;
import edu.secprog.services.AccountService;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Beep xD
 */
@WebServlet(urlPatterns = {"/home"})
public class MainServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          doGet(request,response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //Redirect to default login page
        int userID = 0;
        int responseCode = Audit.OKINFO;
        request.getSession().invalidate();
        try {
            request.getRequestDispatcher("main-login-page.jsp").forward(request, response);
        } catch (ServletException ex) {
            responseCode = Audit.SERVLETEX;
            response.sendError(responseCode, Audit.getHttpStatusMsg(responseCode));
        } catch (IOException ex) {
            responseCode = Audit.IOEX;
            response.sendError(responseCode, Audit.getHttpStatusMsg(responseCode));
        }
        finally {
            if (responseCode != Audit.OKINFO)
                Audit.getAuditLog(userID, responseCode);
        }
    }
}

