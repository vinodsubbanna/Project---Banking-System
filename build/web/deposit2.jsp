<%-- 
    Document   : deposit2
    Created on : Apr 15, 2016, 3:01:06 PM
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
        <SCRIPT LANGUAGE="JavaScript">
            function dil(form)
            {
                for (var i = 0; i < form.elements.length; i++)
                {
                    if (form.elements[i].value == "")
                    {
                        alert("Fill out all Fields")
                        document.F1.accountno.focus()
                        return false
                    }
                }

                if (isNaN(document.F1.amount.value))
                {
                    alert("Amount  must  be  number & can't be null")
                    document.F1.amount.value = ""
                    document.F1.amount.focus()
                    return false
                }
                return true
            }
        </SCRIPT>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Global Banking ..</title>
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

                    <td width="1200" valign="top">
                        <div id="welcome"><h1>DEPOSIT FORM</h1><br>
                            <table align="center">
                                <tr>
                                </tr>
                                <tr>
                                    <td><div><%if (request.getAttribute("balance") != null) {
                                            out.print(request.getAttribute("balance"));
                                        }
                                            %></div>
                                        <form name=F1 onSubmit="return dil(this)" action="deposit22.jsp" >
                                            <table cellspacing="5" cellpadding="3">
                                                <tr><td>Enter the AMOUNT To Deposit:</td><td> <input type="text" name="amount"/></td></tr>
                                                <tr><td><input type="hidden" id="username" name="username" value=<%=username%>></td></tr>
                                                <tr><td><input type="hidden" id="accountno" name="accountno" value=<%=accountno%>></td></tr>
                                                <tr><td></td><td><input type="submit" value="DEPOSIT"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <INPUT TYPE=RESET VALUE="CLEAR"></td></tr>

                                            </table>	
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </div>      
                    </td>         	

                </tr></table>
            <div id="footer_top">

            </div>

            <script type="text/javascript">
//                document.onload = ctck();
            </script>
        </div>

    </body>
</html>


