package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import BankJava.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import BankJava.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 String num;
    int accountno;
    String username;
    String password;
    String amoun;
    String deposit;
    int accoun;
    boolean status, stat;
    int dataamount = 0;


            public boolean depositfunc() {
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
        
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/depositmain.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Main Deposit</title>\n");
      out.write("        <link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"header\">\n");
      out.write("            <h1>NPU BANK<span class=\"style1\"></span></h1>\n");
      out.write("            <h2>ExtraOrdinary Service</h2>\t\n");
      out.write("        </div>\n");
      out.write("        ");

            num = request.getParameter("accountno");
            accountno = Integer.parseInt(num);
            username = request.getParameter("username");
            password = request.getParameter("password");
            amoun = request.getParameter("amount");
            deposit = "Deposit";
            accoun = Integer.parseInt(amoun);
            status = verifyLogin1.checkLogin(accountno, username, password);
            if (status == true) {
                out.print("Welcome    " + username);
                stat = depositfunc();
                out.print("your balance has increase");
                request.setAttribute("totaldataamount", dataamount);
                request.setAttribute("balance", "your balance has increase");
        
      out.write("\n");
      out.write("        ");
      if (true) {
        _jspx_page_context.forward("Totalbalance.jsp");
        return;
      }
      out.write("\n");
      out.write("        ");

        } else {
            out.print("Please check your username and Password");
            request.setAttribute("balance", "Please check your username and Password");
        
      out.write("\n");
      out.write("        ");
      if (true) {
        _jspx_page_context.forward("deposit1.jsp");
        return;
      }
      out.write(" \n");
      out.write("        ");

            }
        
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n");
      out.write("<title>Global Banking ..</title>\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("//function ctck()\n");
      out.write("//{\n");
      out.write("//var sds = document.getElementById(\"dum\");\n");
      out.write("//\n");
      out.write("//}\n");
      out.write("</script>\n");
      out.write("<style>\n");
      out.write("    table tbody tr {\n");
      out.write("        border: 1px solid #000;\n");
      out.write("    }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>  \n");
      out.write("\n");
      out.write("<div id=\"header\">\n");
      out.write("\t<h1>NPU BANK<span class=\"style1\"></span></h1>\n");
      out.write("    <h2>Services</h2>\n");
      out.write("    <A href=\"index.html\"></A>\t\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div id=\"navigation\">\n");
      out.write("    <ul>\n");
      out.write("    <li><a href=\"depositfunc()\">DEPOSIT</a></li>\n");
      out.write("    <li><a href=\"withdraw1.jsp\">WITHDRAW</a></li>\n");
      out.write("    <li><a href=\"transfer1.jsp\">TRANSFER</a></li>\n");
      out.write("    <li><a href=\"history1.jsp\">ACCOUNT HISTORY</a></li>\n");
      out.write("    <li><a href=\"closeac1.jsp\">CLOSE A/C</a></li>\n");
      out.write("    <li><a href=\"closeac1.jsp\">LOGOUT</a></li>\n");
      out.write("    </ul>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<table style=\"width:897px; background:#FFFFFF; margin:0 auto;\">\n");
      out.write("<tr >\n");
      out.write("  \n");
      out.write("    <td width=\"1200\" valign=\"top\">\n");
      out.write("    \t\n");
      out.write("    \t");
 

      out.write("\n");
      out.write("<table>");

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
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
                        ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			
			out.print("<table align='left' cellspacing='5' cellpadding='5' border='1'>");
			out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
			while(rs.next()){
			    int accountno1=rs.getInt(1);
				session.setAttribute("accountno",accountno1);
				
				System.out.print(accountno);
				
				out.print("<tr>");
				out.print("<td>" + rs.getInt(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getInt(5) + "</td>");
				out.print("<td>" + rs.getString(6) + "</td>");
				out.print("<td>" + rs.getInt(7) + "</td>");
				out.print("</tr>");
			
			}
			out.print("</table>");
			
			
			
		}
		else{
			out.print("Please check your username and Password");
			request.setAttribute("balance","Please check your username and Password");
			
      out.write("\n");
      out.write("\t\t\t");
      if (true) {
        _jspx_page_context.forward("balance1.jsp");
        return;
      }
      out.write(" \n");
      out.write("\t\t\t");
 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
	
			
      out.write("</table>");


      out.write("\n");
      out.write("    \t\n");
      out.write("    \t\n");
      out.write("\t\t</table>\n");
      out.write("\n");
      out.write("\n");
      out.write("  \n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
