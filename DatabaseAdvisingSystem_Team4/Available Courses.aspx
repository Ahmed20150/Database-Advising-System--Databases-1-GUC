<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Available Courses.aspx.cs" Inherits="GUI.Available_Courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link rel="Stylesheet" href="StyleSheet.css"/>
<style>
    .styled-table {
    border-collapse: collapse;
    width: 100%;
}

.styled-table th, .styled-table td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="View" onclick="Button1_Click"/>
        </div>
    </form>
</body>
</html>
