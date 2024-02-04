<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin login.aspx.cs" Inherits="WebApplication1.admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            login in here<br />
            username<br />
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
            <br />
            password<br />
            <asp:TextBox ID="passwords" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="signin" runat="server" OnClick="login" Text="log in" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
