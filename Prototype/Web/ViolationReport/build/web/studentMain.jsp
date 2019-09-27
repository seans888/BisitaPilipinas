<%-- 
    Document   : allreports
    Created on : 09 17, 19, 12:20:10 AM
    Author     : macel
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Asia Pacific College - Violation System</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td {
            border: 1px solid black;
            text-align: left;
            padding: 8px; font-size: 12px;
        }
        
        th{
            background-color: #1b4f72; color: white; border: 1px solid black;
            text-align: left;
            padding: 8px; font-size: 14px;
        }

        tr:nth-child(even) {
            background-color: white;
        }
        
        button{
            width: 20%; background-color: #1b4f72; color: white;
            padding: 10px 15px; border: none; margin: 0px 0;
            border-radius: 4px; cursor: pointer; margin-left: 78%; margin-top: 0.5%;
            margin-bottom: 0.5%;
        }
        .center{
            display: block; margin-left: auto; margin-right: auto;
            width: 80%; font-size: 20px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .text{
            display: block; margin-left: auto; margin-right: auto;
            width: 10%; font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
        }
        input[type=text], input[type=date], textarea, select{
            width: 100%; padding: 12px 20px; margin: 0px 0;
            display: block; border: 1px solid #ffbd59;
            border-radius: 4px; box-sizing: border-box; margin-left: auto; 
            margin-right: auto;
        }
        input[type=submit]{
            width: 40%; background-color: #1b4f72; color: white;
            padding: 10px 15px; border: none; margin: 0px 0;
            border-radius: 4px; cursor: pointer; margin-left: auto; 
            margin-right: auto; display: block;
        }
        input[type=submit]:hover{
            background-color: #0d2b40;
        }
        form{
            padding: 5px; width: 100%; display: block; margin-left: auto; 
            margin-right: auto;
        }
        * {
            box-sizing: border-box;
        }
        .row {
            display: flex; 
        }
        /* Create two equal columns that sits next to each other */
        .column {
            flex: 50%; padding: 0px; height: 10%; /* Should be removed. Only for demonstration */
        }
        .column1 {
            flex: 25%; padding: 10px; height: 100%; /* Should be removed. Only for demonstration */
        }
        .column2 {
            flex: 75%; padding: 10px; height: 100%;
        }
        .flex-container {
            display: flex;
            flex-wrap: nowrap;
            width: 100%; margin-right: auto;
            background-color: white; margin-left: auto;
        }
        .flex-container > div {
            background-color: white;
            width: 100%;
            margin: 20px;
            line-height: 3px;
            font-size: 12px;
        }
    </style>
    <body>
        <div class="row">
        <div class="column">
            <img src="pictures/apc.png" style="width: 100%; height: 10%"></div>
            <div class="column">
                <img src="pictures/apc.png" style="width: 100%; height: 10%"></div>
        </div>
        <a href="index.html"><button type="button">Logout</button></a>
        <hr>
      
        <br/><br/>
 
        <table>
            <tr>
                <th>Student id</th>
                <th>Student name</th>
                <th>Student course</th>
                <th>Nature of violation</th>
                <th>Violation level</th>
                <th>Comment</th>
                <th>Date of violation</th>
                <th>Issuer id</th>
                <th>Status</th>
            </tr>
        <% 
            try{
                String id = request.getAttribute("id").toString();
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
                /*PreparedStatement pst1 = conn.prepareStatement("Select stud_id from student where stud_username=?");
                pst1.setString(1, name);
                ResultSet rs1 = pst1.executeQuery();
                if (rs1.next()) {
                    String id = rs1.getString("stud_id");*/
                    PreparedStatement pst = conn.prepareStatement("Select user_id, vio_name, vio_course, vio_nature,"
                            + "vio_comment, vio_issuer, vio_date, vio_status from violation where user_id=?");
                pst.setString(1, id);
                ResultSet rs = pst.executeQuery();
                 while (rs.next()){
                String sid = rs.getString("user_id");
                String nm = rs.getString("vio_name");
                String crs = rs.getString("vio_course");
                String nv = rs.getString("vio_nature");
                String cmt = rs.getString("vio_comment");
                String iid = rs.getString("vio_issuer");
                String dt = rs.getString("vio_date");
                String s = rs.getString("vio_status");
                PreparedStatement pst2 = conn.prepareStatement("Select offense_level from offense where offense_desc=?");
                pst2.setString(1, nv);
                ResultSet rs2 = pst2.executeQuery();
                if (rs2.next()) {
                    String ol = rs2.getString("offense_level");
                    out.println("<tr>"
                        + "<td>" + sid + "</td>"
                        + "<td>" + nm + "</td>"
                        + "<td>" + crs + "</td>"
                        + "<td>" + nv + "</td>"
                        + "<td>" + ol + "</td>"
                        + "<td>" + cmt + "</td>"
                        + "<td>" + dt + "</td>"
                        + "<td>" + iid + "</td>"
                        + "<td>" + s + "</td>"    
                        + "</tr>");
                }
               }
                
            }catch(Exception e){
            out.println(e);
             }
        %>
        </table>
        <br><br>
     
        <div class="row">
            <div class="column">
            <img src="pictures/apc.png" style="width: 100%; height: 10%"></div>
            <div class="column">
                <img src="pictures/apc.png" style="width: 100%; height: 10%"></div>
        </div>
    </body>
</html>