<%
    session.invalidate(); //session destroy
    response.sendRedirect("login.jsp"); //after destroy redirect to index.jsp page
%>
