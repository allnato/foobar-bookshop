package edu.secprog.servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import edu.secprog.dto.Account;
import edu.secprog.dto.Employee;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Beep xD
 */
@WebServlet(urlPatterns = {"/Register"})
public class RegisterServlet extends HttpServlet {

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
        
        Account newEmployee = new Employee();
        
        String email = request.getParameter(Account.COLUMN_EMAIL);
        String pass = request.getParameter(Account.COLUMN_PASSWORD);
        String firstname = request.getParameter(Account.COLUMN_FIRSTNAME);
        String lastname = request.getParameter(Account.COLUMN_LASTNAME);
        String middleinitial = request.getParameter(Account.COLUMN_MIDDLEINITIAL);
        String birthdate = request.getParameter(Account.COLUMN_BIRTHDATE);
        String username = request.getParameter(Account.COLUMN_USERNAME);
        String status = request.getParameter(Account.COLUMN_STATUS);
        
        
        
        
   
    }
}

