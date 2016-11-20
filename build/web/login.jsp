<%-- 
    Document   : login
    Created on : Apr 15, 2016, 2:55:59 PM
    Author     : Vinod Subbanna
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="BankJava.*" %>
<%!int accountno; String username;%>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Global Banking ..</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <style>
            table tbody tr {
                border: 1px solid #000;
            }
        </style>
    </head>
    <body>  
<%
username = request.getParameter("username");
String num = (String)request.getParameter("accountno");
accountno = Integer.parseInt(num);
%>
        <div id="header">
            <h1>FREMONT BANK<span class="style1"></span></h1>
        </div>
        <div id="navigation">
                 <ul>
                    <li><a href="deposit2.jsp?username=<%=username%>&accountno=<%=accountno%>">DEPOSIT</a></li>
                    <li><a href="withdraw2.jsp?username=<%=username%>&accountno=<%=accountno%>">WITHDRAW</a></li>
                    <li><a href="transfer2.jsp?username=<%=username%>&accountno=<%=accountno%>">TRANSFER</a></li>
                    <li><a href="history22.jsp?username=<%=username%>&accountno=<%=accountno%>">ACCOUNT HISTORY</a></li>
                    <li><a href="index.html">LOGOUT</a></li>
                </ul>
        </div>
        <table>
            <tr >

                <td width="1200" valign="top">
               
                    <table><%
                        //String num = request.getParameter("accountno");
                       // accountno = Integer.parseInt(num);
                        username = request.getParameter("username");
                        String password = request.getParameter("password");
                        boolean status = verifyLogin1.checkLogin(accountno, username, password);
                        //if(status==true){
                        //	out.print("Welcome    " + username);
                         
                        try {
                            if (status == true) {
                                out.print("Welcome    " + username);

                                Connection con = GetCon.getCon();
                                PreparedStatement ps = con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
                                ps.setInt(1, accountno);
                                ResultSet rs = ps.executeQuery();

                                out.print("<table align='left' cellspacing='5' cellpadding='5' border='1'>");
                                out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
                                while (rs.next()) {
                                    int accountno1 = rs.getInt(1);
                                    session.setAttribute("accountno", accountno1);
                                    System.out.print(accountno);
                                    out.print("<tr>");
                                    out.print("<td>" + rs.getInt(1) + "</td>");
                                    out.print("<td>" + rs.getString(2) + "</td>");
                                    out.print("<td>" + rs.getInt(5) + "</td>");
                                    out.print("<td>" + rs.getString(6) + "</td>");
                                    out.print("<td>" + rs.getInt(7) + "</td>");
                                    out.print("</tr>");
                                }
                                out.print("</table>");

                            } else {
                                out.print("Please check your username and Password");
                                request.setAttribute("balance", "Please check your username and Password");
                        %>
                        <jsp:forward page="login1.jsp"></jsp:forward> 
                        <%
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }

                        %></table><%
                        %>
        </table>
       
  </body>  
</html>


