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
            border-radius: 4px; cursor: pointer; margin-left: 0%; 
            margin-right: auto; margin-top: 1%;
        }
        input[type=text], input[type=date], textarea{
            width: 20%; padding: 10px 20px; margin: 0px 0;
            border: 1px solid #ffbd59;
            border-radius: 4px; box-sizing: border-box; margin-left: auto; 
            margin-right: auto;
        }
        input[type=submit]{
            width: 15%; background-color: #1b4f72; color: white;
            padding: 10px 15px; border: none; margin: 0px 0;
            border-radius: 4px; cursor: pointer; margin-left: auto; 
            margin-right: auto;            
        }
        input[type=submit]:hover{
            background-color: #0d2b40;
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
        <a href="doMain.html"><button type="button">Back</button></a>
        <br/><br/>
        <table id="table">
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
                int count=1;
                String update = "update.html";
                String delete = "delete.html";
                String row = "row";
                String ubtnrow = "ubtnrow";
                String dbtnrow = "ubtnrow";
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
        </table><br/>
        <div class="flex-container">
            <div style="text-align: right;"><form action="update">
        Student id <input type="text" id="sid" name="sid"><br/>
        Student name <input type="text" id="sname" name="sname"><br/>
        Student course <input type="text" id="scourse" name="scourse"><br/>
        Nature of violation <input type="text" id="violation" name="violation"><br/>
        Comment <textarea id="comment" name="comment"></textarea><br/>
        Issuer id <input type="text" id="aid" name="aid"><br/><br/>
        <input type="submit" value="Update">
            </form></div>
            <div>
        <form action="delete">
        <input type="text" id="sid1" name="sid">Student id <br/>
        <input type="text" id="sname1" name="sname">Student name <br/>
        <input type="text" id="scourse1" name="scourse">Student course<br/>
        <input type="text" id="violation1" name="violation">Nature of violation<br/>
        <textarea id="comment1" name="comment"></textarea>Comment<br/>
        <input type="date" id="date1" name="date" min="2019-09-16">Date<br/>
        <input type="text" id="aid1" name="aid"Issuer id>Issuer id<br/><br/>
        <input type="submit" value="Delete">
        </form></div></div>
        <script>
            var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         document.getElementById("sid").value = this.cells[0].innerHTML;
                         document.getElementById("sname").value = this.cells[1].innerHTML;
                         document.getElementById("scourse").value = this.cells[2].innerHTML;
                         document.getElementById("violation").value = this.cells[3].innerHTML;
                         document.getElementById("comment").value = this.cells[4].innerHTML;
                         document.getElementById("aid").value = this.cells[6].innerHTML;
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
