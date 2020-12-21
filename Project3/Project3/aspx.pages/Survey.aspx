<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="Project3.aspx.pages.Survey" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey</title>
    <link href="../Styles/Navigation.bar.css" rel="stylesheet" />
    <script src="../Javascript/Form.js"></script>
    <link href="../Styles/Text.css" rel="stylesheet" />
</head>
<body onload="DateAndTime()">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
        <li><a href="LogOut.aspx">logout</a></li>
        <li><a href="Gallery.aspx">Pictures</a></li>
        <li><a href="About.aspx">About</a></li>
        <li><a href="Links.aspx">links</a></li>
        <li><a href="Acount.aspx">Acount</a></li>
        <li><div style="color: red"><br /> <% Response.Write(Session["User"]); %>  </div></li>
        <li><div id="date2" style="color: white"> </div></li>  
        <li><div id="txt" style="color: white"> </div></li>
    </ul>
    <form id="SurveyForm" method="post" runat="server">
        <h2>how much times do you visit this site weekly?</h2>
        <h4>0-1</h4>
        <br/>
        <input type="radio" id="ans1" name="ans" value="1" />       
        <h4>2-3</h4> 
        <br/>
        <input type="radio" id="ans2" name="ans" value="2"/>
        <h4>4 and up</h4>
        <br/>
        <input type="radio" id="ans3" name="ans" value="3"/>
        <br />
        <br /> 
        <input type="submit"  id="submit" name="submit" />

        <br />
        <%

            if (Request.Form["submit"] != null && (bool)Session["answer"] == true)
            {
                Session["answer"] = false;

                string choice = Request.Form["ans"];
                switch (choice)
                {
                    case "1":
                        int x = (int)Application["counter1"];
                        x++;
                        Application["counter1"] = x;
                        break;
                    case "2":
                        int y = (int)Application["counter2"];
                        y++;
                        Application["counter2"] = y;
                        break;
                    case "3":
                        int z = (int)Application["counter3"];
                        z++;
                        Application["counter3"] = z;
                        break;
                }
            }
            %>
        <%Response.Write($"{Application["counter1"]} chose option one, {Application["counter2"]} chose option 2 and {Application["counter3"]} chose option 3"); %>
    </form>
</body>
</html>