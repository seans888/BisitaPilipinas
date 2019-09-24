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
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/delete"})
public class delete extends HttpServlet {

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
            String stud_id = request.getParameter("sid");
            String vio_studname = request.getParameter("sname");
            String vio_studcourse = request.getParameter("scourse");
            String vio_nature = request.getParameter("violation");
            String vio_comment = request.getParameter("comment");
            String admin_id = request.getParameter("aid");
            String vio_date = request.getParameter("date");
            SimpleDateFormat formatter = new SimpleDateFormat("yyy-MM-dd");
            java.util.Date dateStr = formatter.parse(vio_date);
            java.sql.Date dateDB = new java.sql.Date(dateStr.getTime());
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
            PreparedStatement pst1 = conn.prepareStatement("Select vio_id from violation where vio_studname=? and vio_date=?");
            pst1.setString(1, vio_studname);
            pst1.setDate(2, dateDB);
            ResultSet rs = pst1.executeQuery();
            if(rs.next()){
                String id = rs.getString("vio_id");
                PreparedStatement pst2 = conn.prepareStatement("Delete from violation where vio_id=? and vio_date=?");
                pst2.setString(1, id);
                pst2.setDate(2, dateDB);
                pst2.executeUpdate();
                RequestDispatcher rd = request.getRequestDispatcher("dallrecords.jsp");
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
