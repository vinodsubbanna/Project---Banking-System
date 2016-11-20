<%-- 
    Document   : transfer2
    Created on : Apr 20, 2016, 4:12:37 PM
    Author     : Vinod Subbanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String username;
    int accountno;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            username = (String) request.getParameter("username");
            String num = (String) request.getParameter("accountno");
            accountno = Integer.parseInt(num);
        %> 
        <div id="top_links">


            <div id="header">
                <h1>FREMONT BANK<span class="style1"></span></h1>
            </div>

            <div id="navigation">
                <ul>
                    <li><a href="login2.jsp?username=<%=username%>&accountno=<%=accountno%>">BACK</a></li>
                    <li><a href="index.html">LOGOUT</a></li>
                </ul>
            </div>
            <table>
                <tr >   
                    <td width="450" valign="top">
                        <div id="welcome"><h1>TRANSFER FORM</h1><br>
                            <table align="center">
                                <tr>

                                </tr>
                                <tr>
                                    <td><div><%if (request.getAttribute("balance") != null) {
                                            out.print(request.getAttribute("balance"));
                                        }

                                            %></div>
                                        <form name=F1 onSubmit="return dil(this)" action="transfer22.jsp" >
                                            <table cellspacing="5" cellpadding="3">
                                                <tr><td>TARGET ACCOUNT NO:</td><td><input type="text" name="taccountno"/></td></tr>
                                                <tr><td>AMOUNT:</td><td> <input type="text" name="amount"/></td></tr>
                                                <tr><td><input type="hidden" id="username" name="username" value=<%=username%>></td></tr>
                                                <tr><td><input type="hidden" id="accountno" name="accountno" value=<%=accountno%>></td></tr>
                                                <tr><td></td><td><input type="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <INPUT TYPE=RESET VALUE="CLEAR"></td></tr>
                                            </table>
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </div>      
                    </td>

                    <td width="250" valign="top">   
                    </td>


                </tr></table>
            <script type="text/javascript">
                document.onload = ctck();
            </script>
        </div>

    </body>
</html>


