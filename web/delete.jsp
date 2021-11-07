<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content - Type" content="text/html; charset=UTF-8">
<title>Delete</title>
</head>
<body>
<%
String id=request.getParameter("d");
int no=Integer.parseInt(id);
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/project4new", "root", "");
Statement st = conn.createStatement();
st.executeUpdate("DELETE FROM biodatasiswa WHERE kode = '"+no+"'");
response.sendRedirect("index.jsp");
} catch(Exception e){
 out.println(e.getMessage());
}
%>
</body>
</html>

