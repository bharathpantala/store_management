/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import config.Dbconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author linux
 */
public class Additem extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, InterruptedException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String itemname = request.getParameter("itemname");
            int stock = 0;
            try{
                 stock = Integer.parseInt(request.getParameter("stock"));
            }
            catch(NumberFormatException e)
            {
                System.out.println(e);
            }
            config.Dbconnection con = new config.Dbconnection();
            ResultSet rs = con.select("Select * from s_items where items = '"+itemname+"'");
            rs.last();
            int l = rs.getRow();
            rs.beforeFirst();
            if(l > 0)
            {
                request.setAttribute("errorMessage", "Item already exists");
            }
            else
            {
                boolean b = con.insert("insert into s_items(items, stock) values('"+itemname+"', "+stock+")");
                
                request.setAttribute("errorMessage", "Item addede successfully. Check below.");
            }
            
            request.getRequestDispatcher("additem.jsp").forward(request, response);
        }
    }

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
        try{
        processRequest(request, response);
        }
        catch(SQLException | InterruptedException e)
        {
            System.out.println(e);
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
       try{
            processRequest(request, response);
        }
        catch(SQLException | InterruptedException e)
        {
            System.out.println(e);
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
