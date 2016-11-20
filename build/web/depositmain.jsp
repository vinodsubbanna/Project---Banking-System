<%-- 
    Document   : depositmain
    Created on : Apr 15, 2016, 3:32:17 PM
    Author     : Vinod Subbanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="BankJava.*" %>
<%! String num;
    int accountno;
    String username;
    String password;
    String amoun;
    String deposit;
    int accoun;
    boolean status, stat;
    int dataamount = 0;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Deposit</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="header">
            <h1>FREMONT BANK<span class="style1"></span></h1>
            <h2>ExtraOrdinary Service</h2>	
        </div>
        <%
            num = request.getParameter("accountno");
            accountno = Integer.parseInt(num);
            username = request.getParameter("username");
            password = request.getParameter("password");
            amoun = request.getParameter("amount");
            deposit = "Deposit";
            accoun = Integer.parseInt(amoun);
            status = verifyLogin1.checkLogin(accountno, username, password);
            if (status == true){
                
                out.print("Welcome    " + username);
                stat = depositfunc(accountno);
                out.print("your balance has increased : ");
                request.setAttribute("totaldataamount", dataamount);
                request.setAttribute("balance", "your balance has increased : ");
        %>
        <jsp:forward page="Totalbalance.jsp"></jsp:forward>
        <%
        } else {
            out.print("Please check your username and Password");
            request.setAttribute("balance", "Please check your username and Password");
        %>
        <jsp:forward page="deposit1.jsp"></jsp:forward> 
        <%
            }
        %>

        <%!

            public boolean depositfunc(int accountno) {
                try {
                    Connection con = GetCon.getCon();
                    PreparedStatement ps = con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
                    ps.setInt(1, accountno);
                    ResultSet rs = ps.executeQuery();
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
                        stat = true;
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return stat;
            }
        %>
    </body>
</html>
