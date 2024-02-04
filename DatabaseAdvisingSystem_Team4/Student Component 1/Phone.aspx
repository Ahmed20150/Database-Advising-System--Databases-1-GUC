<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Phone.aspx.cs" Inherits="GUI.Phone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Phone Number</title>
    <link rel="Stylesheet" href="StyleSheet.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div style="display: flex;
    margin-top: 20%;
    height: 100%;
    flex-direction: row;
    align-items: center;
    justify-content:center">


<div style="font-family:Bahnschrift;margin-bottom:50px;">
<asp:Label ID="Label6" runat="server" Text="Phone Number" ></asp:Label>
</div>

<asp:TextBox runat="server" id="PhoneNum" placeholder="00123456789" borderstyle="Solid" class="yourdad"></asp:TextBox><asp:Button ID="addphone" runat="server" Text=" + " onClick="Add" class="addphone"/>

        </div>
    </form>
</body>
</html>
