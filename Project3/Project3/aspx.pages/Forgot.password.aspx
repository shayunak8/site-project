<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot.password.aspx.cs" Inherits="WebApplication3.aspx_pages.Forgot_password" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8" />
    <title>Forgot password</title>
    <link href="../styles/navigation.bar.css" rel="stylesheet" />
    <script src="../javascript/Form.js"></script>
    <link href="../Styles/pics.css" rel="stylesheet" />
    <link href="../styles/Text.css" rel="stylesheet" />
</head>
<body onload="startTime(); date()">
    <ul>
        <li><a href="sign.in.aspx">Sign in</a></li>
        <li><a href="sign.up.aspx">Sign up</a> </li> 
        <li><div id="date2" style="color: white"></div></li>  
        <li><div id="txt" style="color: white"></div></li>       
    </ul>
	<form id="passform" method="post">
		<p> enter your first name: </p><input type="text" id="firstname" name="firstname" placeholder="enter your first name"  maxlength="15" />
		<br />
        <div id="errname"> </div>
		<br />
        <p>enter username</p>
        <input type="text" name="username" id="username" placeholder="enter your username"   onkeypress="checkUsername('username')"/>
        <br/>
        <div id="errusername"> </div>
        <br/>      
		<p> enter your email: </p><input type="email" name="email" id="email" placeholder="enter your email"/>
		<br />
        <div id="errmail"> </div>
        <br />
		<p>enter phone number</p>
        <input type="tel" name="phone" id="phone" onkeypress="checkphone('phone')" placeholder="enter phone number"/>
        <br />
        <div id="errphone"> </div>
        <br/>
		<input type="submit" value="Submit" name="submit"/>
        <br/>
        <br/>
        <% 
            if (Request.Form["submit"] != null)
            {
                string username = Request.Form["username"];
                string email = Request.Form["email"];
                string phone = Request.Form["phone"];
                string name = Request.Form["firstname"];
                if(MyADOHelper.Exist2(phone, email, username, name))
                {
                    Response.Write("your password is: " + MyADOHelper.ShowPassword(phone));
                }
                else
                    Response.Write("One input or more is not correct");
            }
        %>
	</form>
</body>
</html>