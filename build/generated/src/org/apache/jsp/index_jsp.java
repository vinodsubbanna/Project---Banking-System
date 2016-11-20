package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import BankJava.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      response.setContentType("text/html");
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
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
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
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<div id=\"top_links\">\n");
      out.write("  \n");
      out.write("\n");
      out.write("<div id=\"header\">\n");
      out.write("\t<h1>NPU BANK<span class=\"style1\"></span></h1>\n");
      out.write("    <h2>ExtraOrdinary Service</h2>\n");
      out.write("    <A href=\"index.html\"></A>\t\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div id=\"navigation\">\n");
      out.write("    <ul>\n");
      out.write("    <li><a href=\"create.html\">NEW ACCOUNT</a></li>\n");
      out.write("    <li><a href=\"balance1.jsp\">BALANCE</a></li>\n");
      out.write("    <li><a href=\"deposit1.jsp\">DEPOSIT</a></li>\n");
      out.write("    <li><a href=\"withdraw1.jsp\">WITHDRAW</a></li>\n");
      out.write("    <li><a href=\"transfer1.jsp\">TRANSFER</a></li>\n");
      out.write("    <li><a href=\"closeac1.jsp\">CLOSE A/C</a></li>\n");
      out.write("    <li><a href=\"about.jsp\">Contact Us</a></li>\n");
      out.write("    </ul>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<table style=\"width:897px; background:#FFFFFF; margin:0 auto;\">\n");
      out.write("<tr >\n");
      out.write("    \n");
      out.write("    <td width=\"1200\" valign=\"top\">\n");
      out.write("    \t\n");
      out.write("    \t");
 

      out.write("\n");
      out.write("<table>");


try {
		    Connection con1=GetCon.getCon();
			//PreparedStatement ps1=con1.prepareStatement("Select max(accountno) from newaccount");
			PreparedStatement ps1=con1.prepareStatement("Select max(accountno) from newaccount");
           
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next()){
				int  accountno=rs1.getInt(1);
				request.setAttribute("accountno",accountno);
				}
		    Integer accountno=(Integer)request.getAttribute("accountno");
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno='"+accountno+"'");
           // ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			
			out.print("<table align='left'  cellspacing='5' cellpadding='5'>");
			out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>PASSWORD</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
			while(rs.next()){
				
				session.setAttribute("accountno",accountno);
				
				System.out.print(accountno);
				out.print("<tr>");
				out.print("<td>" + rs.getInt(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getString(3) + "</td>");
				out.print("<td>" + rs.getInt(5) + "</td>");
				
				out.print("<td>" + rs.getString(6) + "</td>");
				out.print("<td>" + rs.getLong(7) + "</td>");
				
				
				//out.print("<td><a href='DeleteServlet' >Delete</a></td>");
			    
				out.print("</tr>");
			    
			}
			out.print("</table>");
			
			out.print("<table align='right'width='40%'>");
			out.print("<tr><td><a href='Compose.html'>COMPOSE</a></td></tr>");
			out.print("<tr><td><a href='InboxServlet'>INBOX</a></td></tr>");
			out.print("<tr><td><a href='LogoutServlet'>LOGOUT</a></td></tr>");
			out.print("<tr><td><a href='DeleteServlet'>Delete</a></td></tr>");
			
			out.print("</table>");
		} catch (SQLException e) {
			e.printStackTrace();
		}
   
			
      out.write("</table>");


      out.write("\n");
      out.write("    \t\n");
      out.write("    \t\n");
      out.write("\t\t</table>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
