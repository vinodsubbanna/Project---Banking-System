<%-- 
    Document   : index
    Created on : Apr 4, 2016, 5:10:35 PM
    Author     : Vinod Subbanna
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="BankJava.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>

    <body>

        <div id="top_links">


            <div id="header">
                <h1>FREMONT BANK<span class="style1"></span></h1>
            </div>

            <div id="navigation">
                <ul>
                    <li><a href="index.html">HOME</a></li>
                    <li><a href="about.jsp">ABOUT</a></li>
                </ul>
            </div>

            <table>
                <tr >

                    <td width="1200" valign="top">

                        <table><%

                            try {
                                Connection con1 = GetCon.getCon();
                                //PreparedStatement ps1=con1.prepareStatement("Select max(accountno) from newaccount");
                                PreparedStatement ps1 = con1.prepareStatement("Select max(accountno) from newaccount");

                                ResultSet rs1 = ps1.executeQuery();
                                while (rs1.next()) {
                                    int accountno = rs1.getInt(1);
                                    request.setAttribute("accountno", accountno);
                                }
                                Integer accountno = (Integer) request.getAttribute("accountno");
                                Connection con = GetCon.getCon();
                                PreparedStatement ps = con.prepareStatement("Select * from NEWACCOUNT where accountno='" + accountno + "'");
                                // ps.setInt(1,accountno);
                                ResultSet rs = ps.executeQuery();
                                out.print("<table align='left'  cellspacing='5' cellpadding='5' border='1'>");
                                out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>PASSWORD</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
                                while (rs.next()) {

                                    session.setAttribute("accountno", accountno);

                                    System.out.print(accountno);
                                    out.print("<tr>");
                                    out.print("<td>" + rs.getInt(1) + "</td>");
                                    out.print("<td>" + rs.getString(2) + "</td>");
                                    out.print("<td>" + rs.getString(3) + "</td>");
                                    out.print("<td>" + rs.getInt(5) + "</td>");

                                    out.print("<td>" + rs.getString(6) + "</td>");
                                    out.print("<td>" + rs.getLong(7) + "</td>");

                                    //out.print("<td><a href='DeleteServlet' >Delete</a></td>");
                                    out.print("</tr>");

                                }
                                out.print("</table>");
                                out.print("</table>");
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }

                            %></table><%
                            %>


            </table>




