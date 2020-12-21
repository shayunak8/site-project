<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign.up.aspx.cs" Inherits="WebApplication3.aspx_pages.sign_up" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8" />
    <title>Sign up</title>
    <link href="../styles/navigation.bar.css" rel="stylesheet" />
    <link href="../styles/Text.css" rel="stylesheet" />
    <link href="../Styles/pics.css" rel="stylesheet" />
    <script src="../javascript/Form.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <style>
        .g-recaptcha{
            margin-left: 575px; 
        }
    </style>
</head>
<body onload="DateAndTime()" >
    <ul>
        <li><a href="sign.in.aspx">Sign in</a></li>
        <li><div style="color: white" id="date2"></div></li>  
        <li><img src="../Media/Pictures/Empty.png" style="height:0"/></li>
        <li><div style="color: white" id="txt" ></div></li>       
    </ul>    
    <form id="upform" method="post">             
        
        <br />
            enter your first name:
            <input type="text" name="firstname" id="firstname" placeholder="enter your first name"  onkeypress="checkname('firstname')"/>
        <br />
        <div id="errname"> </div>
        <br/>
        <br />
            enter your last name:
            <input type="text" name="lname" id="lname" placeholder="enter your last name" onblur="checklname('lname')"/>
        <br />
        <div id="errlname"> </div>
        <br/>
        <p>
            enter username:
            <input type="text" name="username" id="username" placeholder="enter your username"   onkeypress="checkUsername('username')"/>
        </p>
        <div id="errusername"> </div>
        <br/>      
            enter password:
            <input type="password" name="password" id="password" placeholder="enter password"  onkeypress="checkpassword('password')"/>
        <br/>
        <div id="errpassword">
        </div>               
        <br />
        <p>
            confirm password:
            <input type="password" name="password2" id="password2" placeholder="confirm password " onkeypress="checkpassword2('password2')" />
        </p>
        <div id="errpassword2"> </div>
        <br />      
            <p> enter your gender</p>
            <input type="radio" name="gender" id="male" value="male" onchange="checkgender()"/> Male <br/>
            <br />
            <input type="radio" name="gender" id="female" value="female" onchange="checkgender()"/> Female<br/>
            <br />      
        <div id="errgender" style="color:red">must choose gender</div>
        <p>
            enter email:
            <input type="email" name="email" id="email" onkeypress="checkemail('email')" placeholder="enter your email"/>
        </p>
        <div id="erremail"> </div>
        <br />          
        <p>
            enter phone number:
            <input type="tel" name="phone" id="phone" onkeypress="checkphone('phone')" placeholder="enter phone number"/>
        </p>
        <br />
        <div id="errphone"> </div>
        <br />
            <p>  place of living</p>        
            <input type="radio" name="place" id="center" onchange="checkplace()" value='c'/>
            center
       <br />
        <br />
            <input type="radio" name="place" id="north" onchange="checkplace()" value='n'/>
            north
        <br />
       <br />
            <input type="radio" name="place" id="east" onchange="checkplace()" value='e'/>
             east
           <br /> 
        <br />     
            <input type="radio" name="place" id="south" onchange="checkplace()" value='s'/>
            south
        <br />
        <br />
            <input type="radio" name="place" id="west" onchange="checkplace()" value='w'/>            
            west
        <br />
        <div id="errplace" style="color:red">You must choose place</div>
        <br />
        <div class="g-recaptcha" data-sitekey="6LfxEosUAAAAAMuJTtqlYnoOPwGn434dMRHeFTDh"></div>
        <br />
        <br />
        <input type="reset" value="Reset"/>
        <br />
        <br />
        <input type="submit" name="submit" value="Submit" onsubmit ="return CheckAll()"/>
        <br />
        <%
            if (Request.Form["submit"] != null)
            {
                string phone = Request.Form["phone"];
                bool tableCreated = MyADOHelper.GetDBSize() > 0 ? true : false;
                if (MyADOHelper.Exist(phone))
                    Response.Write($"{phone} is already registered in DB");
                else
                {
                    string username = Request.Form["username"];
                    string password = Request.Form["password"];
                    string password2 = Request.Form["password2"];
                    string firstName = Request.Form["firstname"];
                    string lastName = Request.Form["lname"];
                    string email = Request.Form["email"];
                    int gender = Request.Form["gender"] == "male" ? 0 : 1;
                    char location = char.Parse(Request.Form["place"]);                    
                        if (username.Length > 5 && username.Length < 15)
                        {
                            if (password == password2 && password.Length > 7 && password.Length < 17)
                            {
                                MyADOHelper.Insert(username, phone, password, firstName, lastName, email, gender, location);
                                Response.Redirect("Sign.in.aspx");
                            }
                            else
                                Response.Write("password confirm not match or too small/ long");
                        }
                        else
                            Response.Write("username to short or long");
                }
            }
        %>
    </form>
    <a href="Sign.in.aspx"><p> already signed up? </p></a>
</body>
</html>