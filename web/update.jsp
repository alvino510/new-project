<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
        <script src="https://use.fontawesome.com/6a4ab084c1.js"></script>
        <link href="dist/styletambah.css" rel="stylesheet" type="text/css">
        
    </head>
<body>
    <div class="testbox">
<div id="con2">
<h3 align="center">Update Data</h3><p></p>
<form action="" method="post">
<%
try {
String Host = "jdbc:mysql://localhost/project4new";
Connection connection = null; 
Statement statement = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(Host, "root", "");
statement = connection.createStatement();
String u=request.getParameter("u");
int num=Integer.parseInt(u);
String Data = "select * from biodatasiswa where kode='"+num+"'";
rs = statement.executeQuery(Data);
while (rs.next()) {
%>
<form action="" method="post">
                <hr>
                <label></label>
                <input type="hidden" name="kode" value='<%=rs.getString("kode")%>'/>
                <label id="icon" for="name"><i class="icon-user"></i></label>
                <input type="text" name="nama" value='<%=rs.getString("nama")%>'/>
                <label id="icon" for="kelas"><i class="fa fa-university" aria-hidden="true"></i></label>
                <input name="kelas" type="text" value='<%=rs.getString("kelas")%>'/>
                <label id="icon" for="alamat"><i class="fa fa-home "></i></label>
                <input type="text" name="alamat" value='<%=rs.getString("alamat")%>'/>
                <p class="jenis-kelamin">Jenis Kelamin</p>
                <div class="accounttype">
                    <input type="radio" value="Laki-laki" id="radioOne" name="kelamin" checked/>
                    <label for="radioOne" class="radio">Laki - laki</label>
                    <input type="radio" value="Perempuan" id="radioTwo" name="kelamin" />
                    <label for="radioTwo" class="radio">Perempuan</label>
                    </div>
                    <input type="submit" name="submit" value="Simpan" class="button"/>
                <a href="index.jsp">Kembali</a>
            </form>
<%   } 
     rs.close();
   statement.close();connection.close();
} catch (Exception ex) {
out.println("Can't connect to database.");
 out.println(ex.getMessage());
}
%>
</form>
</div>
</div>
</body>
</html>
<% String a=request.getParameter("kode");
   String b=request.getParameter("nama");
   String c=request.getParameter("kelas");
    String d=request.getParameter("kelamin");
    String e=request.getParameter("alamat");
//membuat variabel untuk nampung alamatuntuk akses database nantinya.
 String url="jdbc:mysql://localhost/project4new";
//membuat koneksi ke database dengan jdbc
Connection conn=null;PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
int updateQuery=0;
//untuk mengecek textbox name, city, dan phone tidak kosong
if(a!=null && b!=null && c!=null && d!=null && e!=null){
    if(a!="" && b!="" && c!="" && d!="" && e!=""){
    try{
        conn=DriverManager.getConnection(url,"root","");
    

String   query="update   biodatasiswa   set   nama=?,kelas=?,kelamin=?,alamat=?   where kode='"+a+"'";
ps=conn.prepareStatement(query);
ps.setString(1,b);
ps.setString(2,c);
ps.setString(3,d);
ps.setString(4,e);
updateQuery=ps.executeUpdate();
 if (updateQuery!=0){ 
           
       %>
        <script>
         alert("edit data sukses");
         b="";
         </script>
<%  
       }
      response.sendRedirect("index.jsp");
    }
    
    catch(Exception ex){
        out.println("Koneksi bermasalah");
         out.println(ex.getMessage());
    }
    
    
finally{ps.close();
conn.close();
}
}
}
%>



