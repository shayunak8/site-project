<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication3.aspx_pages.About" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>About</title>
    <link href="../styles/navigation.bar.css" rel="stylesheet" />
    <link href="../styles/text.css" rel="stylesheet" />
    <link href="../Styles/pics.css" rel="stylesheet" />
    <script src="../javascript/Form.js"></script>
</head>
<body onload="startTime(); date()">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
        <li><a href="Sign.in.aspx">logout</a> </li> 
        <li><a href="Gallery.aspx">Pictures</a></li>
        <li><a href="Links.aspx">links</a></li>
        <li><a href="Acount.aspx">Acount</a></li>
        <li><div style="color: red"><br /> <% Response.Write(Session["User"]); %>  </div></li>
        <li><div id="date2" style="color: white"></div></li>  
        <li><div id="txt" style="color: white"></div></li> 
    </ul>
    <h1><a id="top"> About the site</a></h1>
    <ul  >
        <li style="float:inherit"><a href="#p1"> creator </a></li>        
        <li style="float:inherit"><a href="#p2"> for who this site </a></li>        
        <li style="float:inherit"><a href="#p3"> how the site divided </a></li>       
        <li style="float:inherit"><a href="#p4"> enojying this site? </a></li>
    </ul>
        <div style="text-align:left">        
            <h3 id="p1">Creator</h3>
            <p>
                This project was created by Shay Friedman in the 10th grade at the Science Park School. if you want to make contact with this site creator send him email: <a href="https://mail.google.com/mail/u/0/?tab=wm#inbox">shayfriedman101@gmail.com</a>
            </p>
</div>
    <div style="text-align:right" dir="ltr">
        <h3 id="p2" dir="ltr">For who the site is suitable</h3>
        The site was created to concentrate a large number of puzzles of all kinds for all people who like these puzzles.
    </div><br />
    <div style="text-align:left">
        <h3 id="p3">How the site divided</h3>
        The site is divided by difficulty levels of riddles: easy, medium and hard.<br />
        <p>
            Easy- for beginners<br />
            Medium - for experienced<br />
            Very difficult - for very advanced
        </p>
    </div>
    <div style="text-align:right">
        <h3 id="p4">Enjoying the site?</h3>
        If you are enjoying this site tell your friends abuot it! its free 
        <img src="../Media/pictures/smile.png" /><br />
    </div><br /><br />
                <a href="#top">Go to top</a>
</body>
</html>