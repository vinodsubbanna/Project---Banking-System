<%-- 
    Document   : tbalance
    Created on : Apr 4, 2016, 7:53:39 PM
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
                        <table border="2" align="center" width="60%" height="60%">
                            <tr>
                                <td align="center" valign="middle" bgcolor="red"><h4>Accounts Info</h4></td>
                            </tr>
                            <tr>
                                <td>
                                    <%
                                        {
                                            out.print("The target account balance is : ");
                                            out.print(request.getAttribute("target account A"));
                                            out.println(" Reduced balance is : ");
                                            out.print(request.getAttribute("account B"));
                                        }
                                    %>
                                </td>
                            </tr>



                        </table><%
                        %>
            </table>
</html>
