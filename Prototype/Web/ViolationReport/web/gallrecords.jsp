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
            border-radius: 4px; cursor: pointer; margin-left: 1%; 
            margin-right: auto; margin-top: 3%;
        }
    </style>
    <body>
        <a href="guidanceMain.html"><button type="button">Back</button></a>
        <br/><br/>
        <table>
            <tr>
                <th>Student id</th>
                <th>Student name</th>
                <th>Student course</th>
                <th>Nature of violation</th>
                <th>Comment</th>
                <th>Date of violation</th>
                <th>Issuer id</th>
            </tr>
        <% 
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
                PreparedStatement pst = conn.prepareStatement("Select * from violation");
                ResultSet rs = pst.executeQuery();
                while (rs.next()){
                String sid = rs.getString("stud_id");
                String nm = rs.getString("vio_studname");
                String crs = rs.getString("vio_studcourse");
                String nv = rs.getString("vio_nature");
                String cmt = rs.getString("vio_comment");
                String iid = rs.getString("admin_id");
                String dt = rs.getString("vio_date");
                out.println("<tr>"
                        + "<td>" + sid + "</td>"
                        + "<td>" + nm + "</td>"
                        + "<td>" + crs + "</td>"
                        + "<td>" + nv + "</td>"
                        + "<td>" + cmt + "</td>"
                        + "<td>" + dt + "</td>"
                        + "<td>" + iid + "</td>"
                        + "</tr>");
                }
            }catch(Exception e){
            out.println(e);
             }
        %>
        </table>
    </body>
</html>
