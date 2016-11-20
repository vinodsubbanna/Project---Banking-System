<%-- 
    Document   : transfer1
    Created on : Apr 4, 2016, 7:49:40 PM
    Author     : Vinod Subbanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                if (isNaN(document.F1.accountno.value))
                {
                    alert("A/C No.  must  be  number & can't be null")
                    document.F1.accountno.value = ""
                    document.F1.accountno.focus()
                    return false
                }

                if (!isNaN(document.F1.username.value))
                {
                    alert("User Name  must  be  char's & can't be null")
                    document.F1.username.value = ""
                    document.F1.username.focus()
                    return false
                }

                if (!isNaN(document.F1.password.value))
                {
                    alert("Password  must  be  char's & can't be null")
                    document.F1.password.value = ""
                    document.F1.password.focus()
                    return false
                }

                if (isNaN(document.F1.taccountno.value))
                {
                    alert("target account  must  be  number & can't be null")
                    document.F1.taccountno.value = ""
                    document.F1.taccountno.focus()
                    return false
                }
                if (document.F1.accountno.value == document.F1.taccountno.value)
                {
                    alert("Change target accountno");
                    document.F1.taccountno.value = ""
                    document.F1.taccountno.focus()
                    return false
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
                    <li><a href="about.jsp">ABOUT US</a></li>
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
                                        <form name=F1 onSubmit="return dil(this)" action="transfer.jsp" >
                                            <table cellspacing="5" cellpadding="3">
                                                <tr><td>ACCOUNT NO:</td><td> <input type="text" name="accountno"/></td></tr>
                                                <tr><td>USER NAME:</td><td> <input type="text" name="username"/></td></tr>
                                                <tr><td>PASSWORD:</td><td> <input type="password" name="password"/></td></tr>
                                                <tr><td>TARGET ACCOUNT NO:</td><td><input type="text" name="taccountno"/></td></tr>
                                                <tr><td>AMOUNT:</td><td> <input type="text" name="amount"/></td></tr>
                                                <!-- Gender:<br/><br/>
                                                Male<input type="radio" name="gender" value="male"> Female<input type="radio" name="gender" value="female"/><br/><br/> -->

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

