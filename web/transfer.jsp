<%-- 
    Document   : transfer
    Created on : Apr 4, 2016, 7:51:43 PM
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
                <h2>ExtraOrdinary Service</h2>	
            </div>

            <div id="navigation">
                <ul>

                    <li><a href="index.html">HOME</a></li>
                    <li><a href="about.jsp">ABOUT US</a></li>
                </ul>
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
                            String num1 = request.getParameter("taccountno");
                            int taccountno = Integer.parseInt(num1);
                            String deposit = "Deposit";
                            String withdraw = "Withdrawn";
                            String amoun = request.getParameter("amount");
                            int accoun = Integer.parseInt(amoun);
                            //accountno=taccountno;
                            boolean status = verifyLogin1.checkLogin(accountno, username, password);
                            //if(status==true){
                            //	out.print("Welcome    " + username);
                            try {
                                if (status == true) {
                                    out.print("Welcome    " + username);
                                    out.print("       TARGET ACCOUNT NO DOES NOT EXIST -->    " + taccountno);
                            %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%
                                Connection con = GetCon.getCon();
                                PreparedStatement ps = con.prepareStatement("Select * from NEWACCOUNT where accountno='" + taccountno + "'");

                                //ps.setInt(1,accountno);
                                ResultSet rs = ps.executeQuery();
                                int dataamount = 0;

                                if (rs.next()) {
                                    dataamount = accoun + rs.getInt(5);
                                    Connection conTar = GetCon.getCon();
                                    java.util.Date date = new java.util.Date();
                                    long t = date.getTime();
                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                    PreparedStatement psTar = conTar.prepareStatement("INSERT INTO ACCOUNTHISTORY VALUES(?,?,?,?,?,?)");
                                    psTar.setInt(1, taccountno);
                                    psTar.setString(2, rs.getString(2));
                                    psTar.setString(3, deposit);
                                    psTar.setInt(4, accoun);
                                    psTar.setDate(5, sqlDate);
                                    psTar.setInt(6, dataamount);
                                    psTar.executeUpdate();

                                }
                                Connection con1 = GetCon.getCon();

                                PreparedStatement ps1 = con1.prepareStatement("update NEWACCOUNT set amount=? where accountno='" + taccountno + "'");
                                ps1.setInt(1, dataamount);
                                ps1.executeUpdate();
                                ResultSet rs1 = ps1.executeQuery();

                                if (rs1.next()) {
                                }
                                System.out.println("data amonut" + dataamount);
                                request.setAttribute("target account A ", dataamount);
                                Connection con2 = GetCon.getCon();
                                PreparedStatement ps2 = con2.prepareStatement("Select * from NEWACCOUNT where accountno=?");

                                ps2.setInt(1, accountno);
                                ResultSet rs2 = ps2.executeQuery();

                                int dataamount1 = 0;
                                if (rs2.next()) {
                                    dataamount1 = rs2.getInt(5) - accoun;
                                    Connection conSour = GetCon.getCon();
                                    Connection conTar = GetCon.getCon();
                                    java.util.Date date = new java.util.Date();
                                    long t = date.getTime();
                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                    PreparedStatement psSour = conSour.prepareStatement("INSERT INTO ACCOUNTHISTORY VALUES(?,?,?,?,?,?)");
                                    psSour.setInt(1, rs2.getInt(1));
                                    psSour.setString(2, rs2.getString(2));
                                    psSour.setString(3, withdraw);
                                    psSour.setInt(4, accoun);
                                    psSour.setDate(5, sqlDate);
                                    psSour.setInt(6, dataamount1);
                                    psSour.executeUpdate();

                                }
                                Connection con3 = GetCon.getCon();

                                PreparedStatement ps3 = con3.prepareStatement("update NEWACCOUNT set amount=? where accountno='" + accountno + "'");
                                ps3.setInt(1, dataamount1);
                                ps3.executeUpdate();
                                ResultSet rs3 = ps3.executeQuery();

                                if (rs3.next()) {

                                    request.setAttribute("target account A", dataamount);
                                    request.setAttribute("account B", dataamount1);
                            %>
                            <jsp:forward page="tbalance.jsp"></jsp:forward> 
                            <%
                                }
                                
                            } else {
                                out.print("Please check your username and Password and target accountno");
                                request.setAttribute("balance", "Please check your username and Password and target acountno");
                            %>
                            <jsp:forward page="transfer1.jsp"></jsp:forward> 
                            <%
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }


                            %></table><%
                            %>


            </table>






