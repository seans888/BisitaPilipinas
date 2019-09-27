/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
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
@WebServlet(urlPatterns = {"/gviolation"})
public class gviolation extends HttpServlet {

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
            String stud_name = request.getParameter("sname");
            String stud_course = request.getParameter("scourse");
            String vio_nature = request.getParameter("violation");
            String vio_comment = request.getParameter("comment");
            String admin_id = request.getParameter("aid");
            String status = "";
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            /*String username = "admin";
            String password = "admin123";
            String smessage = "You have a violation! Here is your violation details: \n" +
                            "Student id: " + stud_id + "\n" + "Student name: " + stud_name +
                            "\n" + "Student course: " + stud_course + "\n" + "Nature of violation: " +
                            vio_nature + "\n" + "Comment: " + vio_comment + "\n" + "\n" +
                            "If you have a report to make, login to APC Violation System or go to " +
                            "Disciplines Office.";
            String pmessage = "This message is to inform you that " + stud_name + " has violated a " +
                    "school policy. Here is " + stud_name + "'s violation information: \n" +
                    "Nature of violation: " + vio_nature + "\n" + "Comment: " + vio_comment;*/
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
            
                PreparedStatement pst2 = conn.prepareStatement("Select vio_num from violation ORDER BY vio_num DESC LIMIT 1");
                        ResultSet rs1 = pst2.executeQuery();
                        if (rs1.next()){
                            String vio_id = rs1.getString("vio_num");
                            int id = Integer.parseInt(vio_id);
                            id = id + 1;
                            vio_id = Integer.toString(id);
                            PreparedStatement pst3 = conn.prepareStatement("Insert into violation values (?,?,?,?,?,?,?,?,?)");
                            pst3.setString(1, vio_id);
                            pst3.setString(2, stud_id);
                            pst3.setString(3, stud_name);
                            pst3.setString(4, stud_course);
                            pst3.setString(5, vio_nature);
                            pst3.setString(6, vio_comment);   
                            pst3.setTimestamp(7, date);
                            pst3.setString(8, "2007-40014");
                            pst3.setString(9, status);
                            pst3.executeUpdate();
                            RequestDispatcher rd = request.getRequestDispatcher("guardMain.jsp");
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
