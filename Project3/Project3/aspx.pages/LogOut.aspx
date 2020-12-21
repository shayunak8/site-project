<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogOut.aspx.cs" Inherits="Project3.aspx.pages.LogOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form" >
        <%
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Sign.in.aspx");
        %> 
    </form>
</body>
</html>
