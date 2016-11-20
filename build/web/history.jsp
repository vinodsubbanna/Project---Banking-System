<%-- 
    Document   : history
    Created on : Apr 6, 2016, 2:55:13 PM
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

<div id="header">
	<h1>FREMONT BANK<span class="style1"></span></h1>
</div>

<div id="navigation">
    <ul>
    <li><a href="index.html">LOGOUT</a></li>
    </ul>
</div>



<table>
<tr >
  
    <td width="1200" valign="top">
    	<table>
            <%
                String num=request.getParameter("accountno");
		int accountno=Integer.parseInt(num);
                String username=request.getParameter("username");
		String password=request.getParameter("password");
	        boolean status=verifyLogin1.checkLogin(accountno,username,password);
		//if(status==true){
		//	out.print("Welcome    " + username);
		try {
		if(status==true){
			out.print("Welcome    " + username);
		
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from ACCOUNTHISTORY where accountno=?");
                        ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			
			out.print("<table align='left' cellspacing='5' cellpadding='5' border='1'>");
			out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>TRANSACTION</th><th>AMOUNT</th><th>DATE</th><th>BALANCE</th></tr>");
			while(rs.next()){
			    int accountno1=rs.getInt(1);
                            session.setAttribute("accountno",accountno1);	
						
				out.print("<tr>");
				out.print("<td>" + rs.getInt(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getString(3) + "</td>");
				out.print("<td>" + rs.getInt(4) + "</td>");
				out.print("<td>" + rs.getDate(5) + "</td>");
                                out.print("<td>" + rs.getInt(6) + "</td>");
				out.print("</tr>");
			
			}
			out.print("</table>");
			
			
			
		}
		else{
			out.print("Please check your username and Password");
			request.setAttribute("balance","Please check your username and Password");
			%>
			<jsp:forward page="balance1.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
		
			//}
			%></table><%
%>
    	
    	
		</table>


  

