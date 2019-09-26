/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author macel
 */
@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String user_username = request.getParameter("username");
            String user_password = request.getParameter("password");
            String user_role;
            String user_id;
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
            PreparedStatement pst = conn.prepareStatement("Select user_username, user_password, user_role, user_id from user where user_username=? and user_password=?");
            pst.setString(1, user_username);
            pst.setString(2, user_password);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                user_id = rs.getString("user_id");
                user_role = rs.getString("user_role");
                if (user_role.equals("Disciplinary Officer")){
                    request.setAttribute("id", user_id);
                    request.getRequestDispatcher("doMain.jsp").forward(request, response);
                }if (user_role.equals("Guidance Counselor")){
                    request.setAttribute("id", user_id);
                    request.getRequestDispatcher("guidanceMain.jsp").forward(request, response);
                }if (user_role.equals("Guard")) {
                    request.setAttribute("id", user_id);
                    request.getRequestDispatcher("guardMain.jsp").forward(request, response);
                }if (user_role.equals("Student")) {
                    request.setAttribute("id", user_id);
                    request.getRequestDispatcher("studentMain.jsp").forward(request, response);
                }
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Username or password incorrect');");
                out.println("location='index.html';");
                out.println("</script>");
            }
        }catch(Exception e){
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
        processRequest(request, response);
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
        processRequest(request, response);
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
