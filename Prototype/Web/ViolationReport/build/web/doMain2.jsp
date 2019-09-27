<%-- 
    Document   : doMain2
    Created on : Sep 26, 2019, 6:03:01 PM
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
            flex: 20%; padding: 10px; height: 100%; /* Should be removed. Only for demonstration */
        }
        .column2 {
            flex: 80%; padding: 10px; height: 100%;
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
       <form name="f1" action="dviolation">
            <input style="width:78%; display: inline;" type="text" id="sid" name="sid"
                   placeholder="Student id" required value="${id}"> &nbsp; 
            <input type="submit" value="Validate" onclick="form.action='validation2';"
                   style="width: 16%; background-color: white; color: #1b4f72; display: inline;
                   padding: 0px 0px;" disabled><br/><br/>
            <img src="data:image/jpeg;base64,${photo}" style="width: 20%; height: 20%;"><br/><br/>
            <input type="text" id="sname" name="sname"
                   placeholder="Student name" value="${name}"><br/>
            <input type="text" id="scourse" name="scourse"
                   placeholder="Course & Section" value="${course}"><br/>
            <select id="violation" name="violation">
                <option value="" disabled selected>Nature of Violation</option>
                <%
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
            PreparedStatement pst = conn.prepareStatement("Select offense_desc from offense");
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()){
                        String o = rs.getString("offense_desc");
                        out.println("<option value='" + o + "'>" + o + "</option>");
                    }
                    }catch(Exception e){
            out.println(e);}
                    %>
            </select><br/>
            <textarea id="comment" name="comment" placeholder="Comment (optional)"></textarea><br/>
            <input type="text" id="date" name="date" disabled><br/>
            <input type="text" id="aid" name="aid"
                   placeholder="Issuer id" value="${aid}" disabled><br/>
            <input type="submit" value="Submit" onclick="form.action='dviolation';">
        </form>
        </div>
        <div class="column2">
        <table id="table">
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
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
                PreparedStatement pst = conn.prepareStatement("Select user_id, vio_name, vio_course, vio_nature,"
                            + "vio_comment, vio_issuer, vio_date from violation");
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
        </div>
        </div>
        <hr>
        <div class="flex-container">
            <div style="text-align: right;"><form action="update">
        Student id <input type="text" id="sid2" name="sid2" disabled><br/>
        Student name <input type="text" id="sname2" name="sname2" disabled><br/>
        Student course <input type="text" id="scourse2" name="scourse2" disabled><br/>
        Nature of violation<select id="violation2" name="violation2">
                <option value="" disabled selected>Nature of Violation</option>
                <%
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
            PreparedStatement pst = conn.prepareStatement("Select offense_desc from offense");
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()){
                        String o = rs.getString("offense_desc");
                        out.println("<option value='" + o + "'>" + o + "</option>");
                    }
                    }catch(Exception e){
            out.println(e);}
                    %>
            </select><br/>
        Comment <textarea id="comment2" name="comment2"></textarea><br/>
        Date <input type="text" id="date2" name="date2" disabled><br/>
        Issuer id <input type="text" id="aid2" name="aid2" disabled><br/><br/>
        <input type="submit" value="Update">
            </form></div>
            <div>
        <form action="delete">
            Student id <input type="text" id="sid1" name="sid1" disabled><br/>
        Student name <input type="text" id="sname1" name="sname1" disabled><br/>
        Student course <input type="text" id="scourse1" name="scourse1" disabled><br/>
        Nature of violation<select id="violation1" name="violation1" disabled>
                <option value="" disabled selected>Nature of Violation</option>
                <%
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apcviolationsystem?" +
                "user=root&password=");
            PreparedStatement pst = conn.prepareStatement("Select offense_desc from offense");
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()){
                        String o = rs.getString("offense_desc");
                        out.println("<option value='" + o + "'>" + o + "</option>");
                    }
                    }catch(Exception e){
            out.println(e);}
                    %>
            </select><br/>
        Comment <textarea id="comment1" name="comment1" disabled></textarea><br/>
        Date <input type="text" id="date1" name="date1" disabled><br/>
        Issuer id <input type="text" id="aid1" name="aid1" disabled><br/><br/>
        <input type="submit" value="Delete">
        </form></div></div>
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
            
            var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         document.getElementById("sid2").value = this.cells[0].innerHTML;
                         document.getElementById("sname2").value = this.cells[1].innerHTML;
                         document.getElementById("scourse2").value = this.cells[2].innerHTML;
                         document.getElementById("violation2").value = this.cells[3].innerHTML;
                         document.getElementById("comment2").value = this.cells[4].innerHTML;
                         document.getElementById("date2").value = this.cells[5].innerHTML;
                         document.getElementById("aid2").value = this.cells[6].innerHTML;
                         document.getElementById("sid1").value = this.cells[0].innerHTML;
                         document.getElementById("sname1").value = this.cells[1].innerHTML;
                         document.getElementById("scourse1").value = this.cells[2].innerHTML;
                         document.getElementById("violation1").value = this.cells[3].innerHTML;
                         document.getElementById("comment1").value = this.cells[4].innerHTML;
                         document.getElementById("date1").value = this.cells[5].innerHTML;
                         document.getElementById("aid1").value = this.cells[6].innerHTML;
                    };
                }
            
           
        </script>
    </body>
</html>

