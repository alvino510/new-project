package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Project 4</title>\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Quicksand:wght@600;700&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("        <link href=\"dist/styleindex.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-dark bg-dark\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("              <h2 class=\"navbar-title\">\n");
      out.write("                ");

                if(session.getAttribute("login")==null || session.getAttribute("login")=="") //check if condition for unauthorize user not direct access welcome.jsp page
                {
                    response.sendRedirect("login.jsp");
                }
                
      out.write("\n");
      out.write("\n");
      out.write("                Welcome, ");
      out.print(session.getAttribute("login"));
      out.write(" \n");
      out.write("              </h2>\n");
      out.write("              <div class=\"d-flex\">\n");
      out.write("                <a href=\"logout.jsp\" class=\"btn btn-primary active\" role=\"button\" data-bs-toggle=\"button\" aria-pressed=\"true\">Logout</a>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("              <h1> Biodata Siswa</h1>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div id=\"con\">\n");
      out.write("                <div>\n");
      out.write("                    \n");
      out.write("                    <a href=\"tambah.jsp\" class=\"btn btn-sm btn-primary mt-3\">Tambah</a>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            ");
 try {
                    String Host = "jdbc:mysql://localhost/project4new";
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver");

                    connection = DriverManager.getConnection(Host, "root", "");
                    statement = connection.createStatement();
                    String Data = "select * from biodatasiswa";
                    rs = statement.executeQuery(Data);
            
      out.write("\n");
      out.write("            <table>\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Kode</th>\n");
      out.write("                        <th>Nama</th>\n");
      out.write("                        <th>Kelas</th>\n");
      out.write("                        <th>Jenis Kelamin</th>\n");
      out.write("                        <th>Alamat</th>\n");
      out.write("                        <th>Aksi</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                ");
 
                while (rs.next())
                { 
      out.write("\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print(rs.getString("kode"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rs.getString("nama"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rs.getString("kelas"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rs.getString("kelamin"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(rs.getString("alamat"));
      out.write("</td>\n");
      out.write("                        <td><a  href=\"update.jsp?u=");
      out.print(rs.getString("kode"));
      out.write("\"  > edit </a>  /  <a href=\"delete.jsp?d=");
      out.print(rs.getString("kode"));
      out.write("\" > hapus</a></td>\n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("                ");
 }  
                
      out.write("\n");
      out.write("            </table>\n");
      out.write("            ");
 rs.close();
                statement.close();
                connection.close(); } 
                catch(Exception ex){
                out.println(" Can't connect to database ");
                out.println(ex.getMessage());
                }
            
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
