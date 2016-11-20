<%-- 
    Document   : deposit
    Created on : Apr 4, 2016, 7:37:23 PM
    Author     : Vinod Subbanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="BankJava.*" %>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Global Banking ..</title>
        <link href="style.css" rel="stylesheet" type="text/css">

    </head>
    <body>

        <div id="top_links">


            <div id="header">
                <h1>FREMONT BANK<span class="style1"></span></h1>
            </div>

            <div id="navigation">
            </div>
            <table>
                <tr >

                    <td width="1200" valign="top">

                        <%
                        %>
                        <table><%
                            String num = request.getParameter("accountno");
                            int accountno = Integer.parseInt(num);
                            String username = request.getParameter("username");
                            String password = request.getParameter("password");
                            String amoun = request.getParameter("amount");
                            String deposit = "Deposit";
                            int accoun = Integer.parseInt(amoun);
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
                                    int dataamount = 0;
                                    if (rs.next()) {
                                        dataamount = accoun + rs.getInt(5);
                                        Connection con2 = GetCon.getCon();
                                        java.util.Date date = new java.util.Date();
                                        long t = date.getTime();
                                        java.sql.Date sqlDate = new java.sql.Date(t);
                                        PreparedStatement ps2 = con2.prepareStatement("INSERT INTO ACCOUNTHISTORY VALUES(?,?,?,?,?,?)");
                                        ps2.setInt(1, accountno);
                                        ps2.setString(2, username);
                                        ps2.setString(3, deposit);
                                        ps2.setInt(4, accoun);
                                        ps2.setDate(5, sqlDate);
                                        ps2.setInt(6, dataamount);
                                        ps2.executeUpdate();

                                    }
                                    Connection con1 = GetCon.getCon();
                                    PreparedStatement ps1 = con1.prepareStatement("update NEWACCOUNT set amount=? where accountno='" + accountno + "'");
                                    ps1.setInt(1, dataamount);
                                    ps1.executeUpdate();
                                    ResultSet rs1 = ps1.executeQuery();

                                    if (rs1.next()) {
                                        out.print("your balance has increased : ");
                                        request.setAttribute("totaldataamount", dataamount);
                                        request.setAttribute("balance", "your balance has increased : ");
                            %>
                            <jsp:forward page="Totalbalance.jsp"></jsp:forward> 
                            <%
                                }

                            } else {
                                out.print("Please check your username and Password");
                                request.setAttribute("balance", "Please check your username and Password");
                            %>
                            <jsp:forward page="deposit1.jsp"></jsp:forward> 
                            <%
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }

                            %></table><%
                            %>  	
            </table>










