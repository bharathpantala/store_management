/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package dep;
import config.Dbconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;
/**
 *
 * @author linux
 */
public class Sendrequest extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @SuppressWarnings("empty-statement")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             config.Dbconnection d =new Dbconnection();
             String sql =new String();
             boolean a ;
//sql = "insert into s_qty values";
//sql=sql+"('sid','sid','sid')";
//boolean a = d.insert(sql);
String uniqueID = UUID.randomUUID().toString();
String a_year=new String();
a_year= request.getParameter("a_year");
int year = Calendar.getInstance().get(Calendar.YEAR);
String branch= new String();
String clg = new String ();
String  no_of_student =new String() ;
HttpSession session = request.getSession();
branch = (String) session.getAttribute("dep");
clg=  (String) session.getAttribute("clg");
no_of_student=(String)request.getParameter("stud");

ResultSet r = d.select("select * from s_order where clg = '"+clg+"' and dep = '"+branch+"' and a_year = '"+a_year+"'");
r.last();
int l = r.getRow();
if(l > 0)
{
    System.out.println("Request sent before. Updating..");
    request.setAttribute("message", "Updated previous request completely");
    d.delete("delete from s_order where clg = '"+clg+"' and dep = '"+branch+"' and a_year = '"+a_year+"'");
}
r.beforeFirst();

a=d.insert("INSERT INTO `s_order`( `o_id`,`dep`, `a_year`, `year`, `clg`,`no_of_stud`) VALUES ('"+uniqueID+"','"+branch+"','"+a_year+"','"+year+"','"+clg+"','"+no_of_student+"');");
//out.println(request.getParameter("sid"));
String[] item = request.getParameterValues("item");
String[] k= request.getParameterValues("test");
boolean b;
if(item .length==item.length)
{
  for (int i=0;i<item.length;i++)
    {
  
     if(Integer.parseInt(item[i])==0){
         continue;
     }
b = d.insert("insert into s_qty values ('"+uniqueID+"','"+k[i]+"','"+item[i]+"');"); 
    }  
}
request.getRequestDispatcher("postrequest.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Sendrequest.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Sendrequest.class.getName()).log(Level.SEVERE, null, ex);
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
//for (String i : k )
//{
//     
//    for(String j: item){
//        out.println(j);
//        break;
//    }
//   
//
//  
//}
//            for () {
//
//            }
            
//             }
//            while(a.next())
//            {
//                out.println(a.getString("id"));
//            }
        
            
        