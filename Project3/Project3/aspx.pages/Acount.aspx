<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acount.aspx.cs" Inherits="Project3.aspx.pages.Acount" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account</title>
    <link href="../styles/navigation.bar.css" rel="stylesheet" />
    <script src="../javascript/Form.js"></script>
    <link href="../styles/text.css" rel="stylesheet" />
    <link href="../Styles/pics.css" rel="stylesheet" />
</head>
<body onload="DateAndTime()">
    <ul>
        
        <li><a href="Home.aspx">Home</a></li>
        <li><a href="Sign.in.aspx">logout</a> </li> 
        <li><a href="Gallery.aspx">Pictures</a></li>
        <li><a href="About.aspx">About</a></li>
        <li><a href="Links.aspx">links</a></li>
        <li><div style="color: red"><br /> <% Response.Write(Session["User"]); %>  </div></li>
        <li><div id="date2" style="color: white"></div></li>  
        <li><div id="txt" style="color: white"></div></li>
    </ul>
    <form id="AccountForm" method="post">
        <br/>
        <%Response.Write(MyADOHelper.SelfDetails((string)Session["phone"])); %>
        <br/>
        <h2>change password</h2>
        <p> enter new password:</p> <input type="password" name="newPass" id="newPass" placeholder="enter new password" onkeypress="checkpassword()"/>       
        <br/>   
        <div id="errpassword2"> </div>
        <br/>        
        <p>
        confirm new password:</p>
        <input type="password" name="newPass2" id="newPass2" placeholder="confirm new password" onkeypress="checkpassword('newpass2')" />
        <div id="errpassword3"> </div>
        <br />    
        <br />
        <input type="submit" name="submit" value="Submit" onsubmit =""/>
        <br/>
        <h2>change username</h2>        
        <p>enter new username: </p><input type="text" name="newuserName" id="username2" placeholder="enter your new username" onkeypress="checkUsername()"/>
        <br/>
        <div id="errusername2"> </div>
        <br/>
        <p>confirm new username: </p><input type="text" name="newuserName2" id="username3" placeholder="enter your new username" onkeypress="checkUsername()"/>
        <br/>
        <div id="errusername3"> </div>
        <br/>
        <br />
        <input type="submit" name="submit1" value="Submit" onsubmit =""/>
        <br/>
        <br />
        <h2>delete account</h2>       
        <br />          
        <input type="submit" name="submit2" value="Submit" onsubmit =""/>
        <%
            if (Request.Form["submit"] != null)
            {
                string password = Request.Form["newPass"];
                string newPass2 =Request.Form["newPass2"];
                if (newPass2 == password && password.Length > 7 && password.Length < 17) 
                MyADOHelper.UpdatePassword((string)Session["phone"], password);
            }
            if (Request.Form["submit1"] != null)
            {
                string newUserName = Request.Form["newuserName"];
                string newUserName2 = Request.Form["newuserName2"];
                if (newUserName == newUserName2 && newUserName.Length > 5 && newUserName.Length < 15)
                    MyADOHelper.UpdateUserName((string)Session["phone"], newUserName);
            }
            if (Request.Form["submit2"] != null)
            {
                    MyADOHelper.Delete((string)Session["phone"]);
                    Response.Redirect("LogOut.aspx");
            }
        %>
</form>
</body>
</html>