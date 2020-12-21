<%@ Page Language="C#" MasterPageFile="~/Css.Master" AutoEventWireup="true" CodeBehind="Links.aspx.cs" Inherits="WebApplication3.aspx_pages.Links" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
        <li><a href="Sign.in.aspx">logout</a> </li> 
        <li><a href="Gallery.aspx">Pictures</a></li>
        <li><a href="About.aspx">About</a></li>
        <li><a href="Acount.aspx">Acount</a></li>
        <li><div style="color: red"><br /> <% Response.Write(Session["User"]); %>  </div></li>
        <li><div id="date2" style="color: white"></div></li>  
        <li><div id="txt" style="color: white"></div></li>
    </ul>
    <h1>Suggested sites to pracrtice more riddels</h1>
    <a href="http://www.baba-mail.co.il/search.aspx?q=%D7%AA%D7%A9%D7%91%D7%A6%D7%99%D7%9D+%D7%AA%D7%A9%D7%97%D7%A6%D7%99%D7%9D+%D7%9C%D7%94%D7%95%D7%A8%D7%93%D7%94" target="_blank"><h4>site 1: baba mail</h4></a>
    <a href="https://www.14across.co.il/" target="_blank"><h4>site 2: 14 across</h4></a>
    <a href="http://www.yo-yoo.co.il/hidot/" target="_blank"><h4>site 3: yoyo</h4></a>
    <a href="http://fun.walla.co.il/category/2315" target="_blank"><h4>site 4: walla </h4></a>
    <a href="http://www.poter.co.il/games/crosswords" target="_blank"><h4>site 5: poter </h4></a>
</asp:Content>