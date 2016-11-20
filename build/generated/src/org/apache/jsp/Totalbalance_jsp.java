package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Totalbalance_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n");
      out.write("        <title>Global Banking ..</title>\n");
      out.write("        <link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            function ctck()\n");
      out.write("            {\n");
      out.write("                var sds = document.getElementById(\"dum\");\n");
      out.write("\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div id=\"top_links\">\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div id=\"header\">\n");
      out.write("                <h1>NPU BANK <span class=\"style1\"></span></h1>\n");
      out.write("                <h2>ExtraOrdinary Service</h2>\n");
      out.write("                <A href=\"index.html\">INDEX</A>\t\n");
      out.write("            </div>\n");
      out.write("            <div id=\"navigation\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"create.html\">NEW ACCOUNT</a></li>\n");
      out.write("                    <li><a href=\"balance1.jsp\">BALANCE</a></li>\n");
      out.write("                    <li><a href=\"deposit1.jsp\">DEPOSIT</a></li>\n");
      out.write("                    <li><a href=\"withdraw1.jsp\">WITHDRAW</a></li>\n");
      out.write("                    <li><a href=\"transfer1.jsp\">TRANSFER</a></li>\n");
      out.write("                    <li><a href=\"closeac1.jsp\">CLOSE A/C</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <table style=\"width:897px; background:#FFFFFF; margin:0 auto;\">\n");
      out.write("                <tr >\n");
      out.write("\n");
      out.write("                    <td width=\"1200\" valign=\"top\">\n");
      out.write("\n");
      out.write("                        ");

                        
      out.write("\n");
      out.write("                        <table>\n");
      out.write("                            <tr>\n");
      out.write("                                <td align=\"center\" valign=\"middle\" bgcolor=\"red\"><h4>Account Info</h4></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                                    ");
if (request.getAttribute("balance") != null) {
                                            out.print(request.getAttribute("balance"));
                                            out.print(request.getAttribute("totaldataamount"));
                                        }
                                    
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                        </table>");

                        
      out.write("  \t\n");
      out.write("            </table>\n");
      out.write("</html>");
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
