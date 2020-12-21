<%@ Page Title="Home" Language="C#" MasterPageFile="~/Css.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Project3.WebForm1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li><a href="LogOut.aspx">logout</a></li>
        <li><a href="Gallery.aspx">Pictures</a></li>
        <li><a href="About.aspx">About</a></li>
        <li><a href="Links.aspx">links</a></li>
        <li><a href="Acount.aspx">Acount</a></li>
        <li><div style="color: red"><br /> <% Response.Write(Session["User"]); %>  </div></li>
        <li><div id="date2" style="color: white"> </div></li>  
        <li><div id="txt" style="color: white"> </div></li>       
    </ul>
    <h1 style="color: aqua"> riddle for me </h1>
    <img src="/../Media/pictures/party.png" />
    <br/>
    <br/>
    <br/>
    <a href="Survey.aspx">please help us and answer this very short survey</a>
    <br/>
    <br/>
    <br/>
    <form method="post">
    <h2>search your friends!</h2>
    <p>check if your friends in this name list: <% Response.Write(MyADOHelper.AllNames()); %> </p>
    <h4>search by inputs (for admins only)</h4>
    <br/>
    <p>by username</p>
    <input type="text" name="username" id="username" placeholder="enter your username"   onkeypress="checkUsername('username')"/>
    <br/>
    <input type="submit" name="submit1" value="Submit" />
    <p>by email</p>
    <input type="email" name="email" id="email" onkeypress="checkemail('email')" placeholder="enter your email"/>
    <br/>
    <input type="submit" name="submit2" value="Submit" />
    <p>by phone</p>
    <input type="tel" name="phone" id="phone" onkeypress="checkphone('phone')" placeholder="enter phone number"/>
    <br/>
    <input type="submit" name="submit3" value="Submit" />
    <h3>see all users data</h3>
    <br/>
    <input type="submit" name="submit4" value="Submit" />
    <h3>make someone admin by phone</h3>
    <input type="tel" name="phone2" id="phone2" onkeypress="checkphone('phone')" placeholder="enter phone number"/>
    <br/>
    <input type="submit" name="submit5" value="Submit" />
    <br/>
    <h3>make someone not admin by phone</h3>
    <input type="tel" name="phone3" id="phone3" onkeypress="checkphone('phone')" placeholder="enter phone number"/>
    <br/>
    <input type="submit" name="submit6" value="Submit" />
        <br/>
    <%
            string phone = Request.Form["phone"];
            string phone2 = Request.Form["phone2"];
            string phone3 = Request.Form["phone3"];
            string username = Request.Form["username"];
            string email = Request.Form["email"];
            if (Request.Form["submit1"] != null)
            {
                Response.Write(MyADOHelper.AllNamesByUserName(username, (string)Session["phone"]));
            }
            if (Request.Form["submit2"] != null)
            {
                Response.Write(MyADOHelper.AllNamesByEmail(email, (string)Session["phone"]));
            }
            if (Request.Form["submit3"] != null)
            {
                Response.Write(MyADOHelper.AllNamesByPhone(phone, (string)Session["phone"]));
            }
            if (Request.Form["submit4"] != null)
            {
                Response.Write(MyADOHelper.AllData((string)Session["phone"]));
            }
            if (Request.Form["submit5"] != null && (bool)Session["admin"] == true)
            {
                MyADOHelper.MakeAdmin(phone2);
            }
            if (Request.Form["submit6"] != null && (bool)Session["admin"] == true)
            {
                MyADOHelper.MakeUnAdmin(phone3);
            }
    %>
    </form>
</asp:Content>
