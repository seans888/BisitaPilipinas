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
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
            String stud_id = request.getParameter("sid1");
            String vio_studname = request.getParameter("sname1");
            String vio_studcourse = request.getParameter("scourse1");
            String vio_nature = request.getParameter("violation1");
            String vio_comment = request.getParameter("comment1");
            String admin_id = request.getParameter("aid1");
            String vio_date = request.getParameter("date1");
            DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            Date date = inputFormat.parse(vio_date);
            DateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String outputString = outputFormat.format(date);
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
            //PreparedStatement pst1 = conn.prepareStatement("Select vio_num from violation where vio_date=?");
           /* pst1.setTimestamp(1, timets);
            ResultSet rs = pst1.executeQuery();
            if(rs.next()){
                String id = rs.getString("vio_num");*/
                PreparedStatement pst2 = conn.prepareStatement("Update violation set vio_status=? where vio_date=?");
                pst2.setString(1, "Cancelled");
                pst2.setString(2, outputString);
                pst2.executeUpdate();
                RequestDispatcher rd = request.getRequestDispatcher("doMain.jsp");
                rd.include(request, response);
           // }     
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
