<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sign.in.aspx.cs" Inherits="WebApplication3.aspx_pages.sign__in" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
    <title>Sign in</title>
    <link href="../Styles/Navigation.bar.css" rel="stylesheet" />
    <link href="../Styles/Text.css" rel="stylesheet" />
    <script src="../Javascript/SignIn.js"></script>
    <link href="../Styles/pics.css" rel="stylesheet" />
    <style>
        .g-recaptcha{
            margin-left: 575px;
        }
    </style>
</head>
<body onload="DateAndTime()">
    <ul>
        <li><a href="sign.up.aspx">Sign up</a> </li> 
        <li><div style="color: white" id="date"></div></li>  
        <li><div id="txt" style="color: white"></div></li>       
    </ul>
    <form id="inform" method="post">
        <p>enter username: </p><input type="text" name="username" id="username" placeholder="enter your username" onkeypress="checkUsername()"/>
        <br/>
        <div id="errusername"> </div>
        <br/>
        <p> enter password:</p> <input type="password" name="password" id="password" placeholder="enter password" onkeypress="checkpassword()"/>       
        <br/>   
        <div id="errpassword"> </div>
        <br/>        
        <p>enter phone number</p>
        <input type="tel" name="phone" id="phone" onkeypress="checkphone('phone')" placeholder="enter phone number"/>
        <br />
        <div id="errphone"> </div>
        <br/>
        <p> remember username?</p>
        <input type="checkbox" name="remember" id="remember" onclick="checkSave('remember')"/>
        <br/>
        <div id="rememberCheckecd"></div>
        <br/>
        <br/>        
        <div id="captcha" class="g-recaptcha" data-sitekey="6LcAv5sUAAAAAE1dSsFYuQI-axxE9CaT1WgXYABB"></div>
        <br />
        <br />
        <input name="submit" type="submit" value="Submit" id="submit2" onsubmit="return CheckAllV2()" />
        <br/>
        <br/>
        <a href="forgot.password.aspx"><p>forgot password?</p></a>
        <br/>
        <%
            int failedAttempts = (int)Session["failedAttempts"];
            Session["answer"] = true;
            if (Request.Form["submit"] != null)
            {
                string username = Request.Form["username"];
                string password = Request.Form["password"];
                string phone = Request.Form["phone"];
                if (MyADOHelper.Exist(phone))
                {
                    if (MyADOHelper.Authentication(username, password, phone))
                    {
                        Session["phone"] = (string)phone;
                        Session["User"] = "hello " + MyADOHelper.GetName(phone) + "  ";
                        Session["admin"] =MyADOHelper.GetAdmin(phone);
                        Response.Write("User signed in successfuly!");
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        failedAttempts++;
                        Response.Write($"{phone} failed to login. Fails attempt #{failedAttempts} <br />");
                        Session["failedAttempts"] = failedAttempts;
                        if (failedAttempts > 3)
                        {
                            Response.Redirect("Forgot.password.aspx");
                        }
                    }
                }
                else
                    Response.Write("phone number not appear in the system");
            }
        %>
    </form>
</body>
</html>