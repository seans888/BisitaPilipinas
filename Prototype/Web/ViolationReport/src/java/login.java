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
            String stud_username = request.getParameter("username");
            String stud_password = request.getParameter("password");
            String admin_username = request.getParameter("username");
            String admin_password = request.getParameter("password");
            String admin_role;
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
            PreparedStatement pst = conn.prepareStatement("Select stud_username, stud_password from student where stud_username=? and stud_password=?");
            pst.setString(1, stud_username);
            pst.setString(2, stud_password);
            PreparedStatement psta = conn.prepareStatement("Select admin_username, admin_password, admin_role from admin where admin_username=? and admin_password=?");
            psta.setString(1, admin_username);
            psta.setString(2, admin_password);
            ResultSet rs = pst.executeQuery();
            ResultSet rsa = psta.executeQuery();
            if(rs.next()){
                request.setAttribute("username", stud_username);
                request.getRequestDispatcher("studentMain.jsp").forward(request, response);
            }else if (rsa.next()) {
                admin_role = rsa.getString("admin_role");
                if (admin_role.equals("Disciplinary Officer")){
                    RequestDispatcher rd = request.getRequestDispatcher("doMain.html");
                    rd.include(request, response);
                }if (admin_role.equals("Guidance Counselor")){
                    RequestDispatcher rd = request.getRequestDispatcher("guidanceMain.html");
                    rd.include(request, response);
                }if (admin_role.equals("Guard")) {
                    RequestDispatcher rd = request.getRequestDispatcher("guardMain.html");
                    rd.include(request, response);
                }
            }else {
                out.println();
                out.println();
              //  out.println("Sorry username or password error");
                RequestDispatcher rd = request.getRequestDispatcher("index.html");
                rd.include(request, response);
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
