<%
    if(session.getAttribute("login")!=null)
    {
        response.sendRedirect("index.jsp"); //session login user not back to index.jsp page or not type direct in url
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
        <script language="javascript">	
	function validate()
	{
            var username = document.LoginForm.txt_username; //get form name "LoginForm" and textbox name "txt_username" store in variable username
            var password = document.LoginForm.txt_password; //get form name "LoginForm" and textbox name "txt_password" store in variable password
				
            if (username.value == null || username.value == "") //check username textbox not blank
            {
		window.alert("please enter username ?"); //alert message
		username.style.background = '#f08080'; //set textbox color
		username.focus();
		return false;
            }
            if (password.value == null || password.value == "") //check password textbox not blank
            {
		window.alert("please enter password ?"); //alert message
		password.style.background = '#f08080'; //set textbox color
		password.focus();
		return false;
            }
	}		
	</script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600;700&display=swap" rel="stylesheet">
        <link href="dist/style.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        <h1 class="title">Welcome</h1>
                <div class="login-block">
                    <h1>Login</h1>
                    <form class="login" method="post" action="LoginController" name="LoginForm" onsubmit="return validate();">
                    <input type="text" value="" placeholder="Username" name="txt_username" id="username" />
                    <input type="password" value="" placeholder="Password" name="txt_password" id="password" />
                    <input type="submit" class="button" name="btn_login" value="login">
                    </form>
                </div>
            <h3 style="color:red">
                <%
                    if(request.getAttribute("WrongLoginMsg")!=null)
                    {
                        out.println(request.getAttribute("WrongLoginMsg")); //get login error message from LoginController
                    }
                %>
            </h3>

    
    </body>
</html>