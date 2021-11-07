
<%@page import="java.sql.DriverManager"%><%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%><%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project 4</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="dist/styleindex.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
              <h2 class="navbar-title">
                <%
                if(session.getAttribute("login")==null || session.getAttribute("login")=="") //check if condition for unauthorize user not direct access welcome.jsp page
                {
                    response.sendRedirect("login.jsp");
                }
                %>

                Welcome, <%=session.getAttribute("login")%> 
              </h2>
              <div class="d-flex">
                <a href="logout.jsp" class="btn btn-primary active" role="button" data-bs-toggle="button" aria-pressed="true">Logout</a>
              </div>
            </div>
        </nav>
              <h1> Biodata Siswa</h1>
        <div class="container">
            <div id="con">
                <div>
                    
                    <a href="tambah.jsp" class="btn btn-sm btn-primary mt-3">Tambah</a>
                </div>

            <% try {
                    String Host = "jdbc:mysql://localhost/project4new";
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver");

                    connection = DriverManager.getConnection(Host, "root", "");
                    statement = connection.createStatement();
                    String Data = "select * from biodatasiswa";
                    rs = statement.executeQuery(Data);
            %>
            <table>
                <thead>
                    <tr>
                        <th>Kode</th>
                        <th>Nama</th>
                        <th>Kelas</th>
                        <th>Jenis Kelamin</th>
                        <th>Alamat</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <% 
                while (rs.next())
                { %>
                <tbody>
                    <tr>
                        <td><%=rs.getString("kode")%></td>
                        <td><%=rs.getString("nama")%></td>
                        <td><%=rs.getString("kelas")%></td>
                        <td><%=rs.getString("kelamin")%></td>
                        <td><%=rs.getString("alamat")%></td>
                        <td><a  href="update.jsp?u=<%=rs.getString("kode")%>"  > edit </a>  /  <a href="delete.jsp?d=<%=rs.getString("kode")%>" > hapus</a></td>
                    </tr>
                </tbody>
                <% }  
                %>
            </table>
            <% rs.close();
                statement.close();
                connection.close(); } 
                catch(Exception ex){
                out.println(" Can't connect to database ");
                out.println(ex.getMessage());
                }
            %>
            </div>
        </div>
    </body>
</html>
