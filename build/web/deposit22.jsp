<%-- 
    Document   : deposit22
    Created on : Apr 16, 2016, 3:29:44 PM
    Author     : Vinod Subbanna
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="BankJava.GetCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            String deposit = "Deposit";
            int dataamount = 0;
        %>
        <%  
             String username = (String) request.getParameter("username");
             String num = (String) request.getParameter("accountno");
           //String num = request.getParameter("accountno");
           int accountno =Integer.parseInt(num);
          String amoun = request.getParameter("amount");
          int accoun = Integer.parseInt(amoun);
         //String username = (String) request.getAttribute("username");
        %>
        <%
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
                    out.print("your balance has increased :");
                    request.setAttribute("totaldataamount", dataamount);
                    request.setAttribute("balance", "your balance has increased : ");
        %>
        <jsp:forward page="Totalbalance.jsp"></jsp:forward> 
        <%
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
