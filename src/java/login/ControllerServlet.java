package login;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class ControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
  
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
        protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException, ClassNotFoundException, SQLException, InterruptedException 
        {
            response.setContentType("text/html;charset=UTF-8");
            boolean status; 
            try (PrintWriter out = response.getWriter()) {
            String userid=(String)request.getParameter("userid");  
            String password=(String)request.getParameter("password");
            String clg =(String)request.getParameter("clg");
            LoginBean bean=new LoginBean();  
            bean.setName(userid);  
            bean.setPassword(password);  
            bean.setClg(clg);
            request.setAttribute("bean",bean);  
            HttpSession session = request.getSession();
                status =bean.validate();
                if(status)
                {
                    if(clg.equals("Admin"))
                    {
                        session.setAttribute("log","1");
                        session.setAttribute("user",clg);     
                        session.setAttribute("name",userid);     
                        response.sendRedirect("admin/index.jsp");
                    }
                    else
                    {
                        session.setAttribute("log","2");
                        session.setAttribute("user",clg);
                        session.setAttribute("dep",userid);
                        session.setAttribute("clg",bean.getClg());
                        RequestDispatcher rd=request.getRequestDispatcher("dep/index.jsp");
                        request.setAttribute("log", "value");
                        Cookie ck=new Cookie("name",userid);  
                        response.addCookie(ck); 
                        response.sendRedirect("dep/index.jsp");
                    }
                }
                else
                {   request.setAttribute("errorMessage", "Invalid Details");
                    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
                    rd.forward(request, response);
                }
            }
        
        catch(Exception e)
        {
            out.println(e);
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
            // try {
        //     processRequest(request, response);
        // } catch (ClassNotFoundException ex) {
        //     Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
        // } catch (SQLException ex) {
        //     Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
        // }
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
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