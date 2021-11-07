<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tambah</title>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
        <script src="https://use.fontawesome.com/6a4ab084c1.js"></script>
        <link href="dist/styletambah.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="testbox">
            <h1>Registration</h1>

            <form action="" method="post">
                <hr>
                <label id="icon" for="nama"><i class="icon-user"></i></label>
                <input type="text" name="nama" id="name" placeholder="Nama" required/>
                <label id="icon" for="kelas"><i class="fa fa-university" aria-hidden="true"></i></label>
                <input type="text" name="kelas" id="name" placeholder="Kelas" required/>
                <label id="icon" for="alamat"><i class="fa fa-home "></i></label>
                <input type="text" name="alamat" id="name" placeholder="Alamat" required/>
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
        </div>
    </body>
</html>

<% String b=request.getParameter("nama");
   String c=request.getParameter("kelamin");
   String d=request.getParameter("alamat");
   String e=request.getParameter("kelas");
   
  
//membuat variabel untuk nampung alamat untuk akses database nantinya.
String url="jdbc:mysql://localhost/project4new";
//membuat koneksi ke database dengan jdbcConnection conn=null;

Connection conn=null;
PreparedStatement ps=null;

              
Class.forName("com.mysql.jdbc.Driver").newInstance();
int updateQuery=0;
//untuk mengecek textbox name, city, dan phone tidak kosong
if(b!=null && c!=null && d!=null && e!=null ){
        if(b!="" && c!="" && d!="" && e!="" )
    { 
             try{
                
             conn=DriverManager.getConnection(url,"root","");
            String queryq="insert into biodatasiswa(nama,kelamin,alamat,kelas) values(?,?,?,?)";
     //      out.println("query="+query);
             ps=conn.prepareStatement(queryq);   
           ps.setString(1,b);
           ps.setString(2,c);
           ps.setString(3,d);
           ps.setString(4,e);

    
        updateQuery=ps.executeUpdate();
       //out.println(updateQuery);
       if (updateQuery!=0){ 
           
       %>
        <script>
         alert("input data sukses");
         </script>
<%  
       }
       else {
        %>   
        <script>
        alert("inputdata tidak berhasil");
        </script>
        <%
       }
             } 
    
        catch(Exception ex){
      out.println(ex.getMessage());
        }
        finally { 
             ps.close();
             conn.close();

       }
 }
}
%>

