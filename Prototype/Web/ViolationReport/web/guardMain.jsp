<%-- 
    Document   : guardMain
    Created on : Sep 24, 2019, 7:23:13 PM
    Author     : jlsolomon
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
    </style>
    <body onload="myFunction()">
        <div class="row">
        <div class="column">
            <img src="pictures/apc.png" style="width: 100%; height: 10%"></div>
            <div class="column">
                <img src="pictures/apc.png" style="width: 100%; height: 10%"></div>
        </div>
        <a href="index.html"><button type="button">Logout</button></a>
        <hr>
        <div class="row">
        <div class="column1">
       <form name="f1" action="gviolation">
            <input style="width:78%; display: inline;" type="text" id="sid" name="sid"
                   placeholder="Student id" required> &nbsp; 
            <input type="submit" value="Validate" onclick="f1.action='validation'"
                   style="width: 16%; background-color: white; color: #1b4f72; display: inline;
                   padding: 0px 0px;"><br/><br/>
            <input type="file" id="photo" name="photo" size="50" disabled><br/><br/>
            <input type="text" id="sname" name="sname"
                   placeholder="Student name" disabled><br/>
            <input type="text" id="scourse" name="scourse"
                   placeholder="Course & Section" disabled><br/>
            <select id="violation" name="violation" disabled>
                <option value="" disabled selected>Nature of Violation</option>
            </select><br/>
            <textarea id="comment" name="comment" placeholder="Comment (optional)" disabled></textarea><br/>
            <input type="text" id="date" name="date" disabled><br/>
            <input type="text" id="aid" name="aid"
                   placeholder="Issuer id" value="${id}" disabled><br/>
            <input type="submit" value="Submit" onclick="f1.action='gviolation';" disabled="">
        </form>
        </div>
        <div class="column2">
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
                String id = "2007-40014";
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
                PreparedStatement pst = conn.prepareStatement("Select user_id, vio_name, vio_course, vio_nature,"
                            + "vio_comment, vio_issuer, vio_date from violation where vio_issuer=?");
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
        </div>
        </div>
        <div class="row">
        <div class="column">
            <img src="pictures/apc1.png" style="width: 100%; height: 10%"></div>
            <div class="column">
                <img src="pictures/apc1.png" style="width: 100%; height: 10%"></div>
        </div>
        <script>
            function myFunction() {
                document.getElementById('date').value= Date();
            }
        </script>
    </body>
</html>
