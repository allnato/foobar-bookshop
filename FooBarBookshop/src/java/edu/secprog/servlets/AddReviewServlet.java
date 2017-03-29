/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.servlets;

import edu.secprog.dto.Review;
import edu.secprog.services.AccountService;
import edu.secprog.services.ProductService;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mark Christian Sanchez
 */
@WebServlet(name = "AddReviewServlet", urlPatterns = {"/addReview"})
public class AddReviewServlet extends HttpServlet {


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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Get IDs
        int userID = (Integer)request.getSession().getAttribute("userID");
        int customerID = AccountService.getCustomerID(userID);
        System.out.println(request.getParameter("id"));
        int productID = Integer.parseInt(request.getParameter("id"));
        //Get Message
        String message = request.getParameter("message");
        //Get Current Date
        Date date = new Date();
        String currentDate= new SimpleDateFormat("yyyy-MM-dd").format(date);
        
        //Create & Construct Review Instance
        Review review = new Review();
        review.setCustomerID(customerID);
        review.setDateReviewed(currentDate);
        review.setMessage(message);
        
        if(ProductService.addReview(review, productID)){
            response.setContentType("text/html");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write("true");
        } else{
            response.setContentType("text/html");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write("false");
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
