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
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;

/**
 *
 * @author macel
 */
@WebServlet(urlPatterns = {"/update"})
public class update extends HttpServlet {

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
            String vio_nature = request.getParameter("violation2");
            String vio_comment = request.getParameter("comment2");
            String vio_date = request.getParameter("date2");
            DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            Date date = inputFormat.parse(vio_date);

            DateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String outputString = outputFormat.format(date);
            //DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            //java.util.Date date = (java.util.Date)formatter.parse(vio_date);
            //Timestamp timets = new Timestamp(date.getTime());
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
           /* PreparedStatement pst1 = conn.prepareStatement("Select vio_num from violation where vio_date=?");
            pst1.setString(1, outputString);
            ResultSet rs = pst1.executeQuery();
            RequestDispatcher rd = request.getRequestDispatcher("doMain.jsp");
                rd.include(request, response);
            if(rs.next()){
                String id = rs.getString("vio_num");*/
                PreparedStatement pst2 = conn.prepareStatement("Update violation set vio_nature=?, vio_comment=? where vio_date=?");
                pst2.setString(1, vio_nature);
                pst2.setString(2, vio_comment);
                pst2.setString(3, outputString);
                pst2.executeUpdate();
                RequestDispatcher rd1 = request.getRequestDispatcher("doMain.jsp");
                rd1.include(request, response);
          // }     
            /*
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
            PreparedStatement pst1 = conn.prepareStatement("Select vio_date from violation where vio_nature=? and vio_comment=?");
           pst1.setString(1, vio_nature);
           pst1.setString(2, vio_comment);
           ResultSet rs = pst1.executeQuery();
            if(rs.next()){
                String Date = rs.getString("vio_date");
                String nv = rs.getString("vio_nature");
                String c = rs.getString("vio_comment");
            }*/
        }catch(Exception e){
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
