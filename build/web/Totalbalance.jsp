<%-- 
    Document   : Totalbalance
    Created on : Apr 4, 2016, 7:40:31 PM
    Author     : Vinod Subbanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <h1>FREMONT BANK <span class="style1"></span></h1>
            </div>
            <div id="navigation">
                <ul>
                    <li><a href="index.html">HOME</a></li>
                    <li><a href="about.jsp">ABOUT US</a></li>
                </ul>
            </div>
            <table>
                <tr>
                    <td width="1200" valign="top">
                        <%
                        %>
                        <table>
                            <tr>
                                <td align="center" valign="middle" bgcolor="#ddd"><h4>Account Info</h4></td>
                            </tr>
                            <tr>
                                <td><h4>
                                        <%if (request.getAttribute("balance") != null) {
                                                out.print(request.getAttribute("balance"));
                                                out.print(request.getAttribute("totaldataamount"));
                                            }
                                        %>
                                    </h4></td>
                            </tr>
                        </table><%
                        %>  	
            </table>
</html>