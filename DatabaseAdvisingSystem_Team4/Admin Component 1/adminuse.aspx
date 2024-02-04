<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminuse.aspx.cs" Inherits="WebApplication1.adminuse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>



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
            <asp:Button ID="listadvisors" runat="server" Text="list all advisors " OnClick="listadvisors_Click" />
            <asp:Button ID="stad" runat="server" Text="list student with thier advisor" OnClick="stad_Click" />
            <asp:Button ID="pending" runat="server" Text="list all pending requests" OnClick="pending_Click" />
            <asp:Button ID="intructorcourse" runat="server" Text="list instructors with their courses" OnClick="intructorcourse_Click" />
            <asp:Button ID="semestercourse" runat="server" Text="list all semesters with their offered courses" OnClick="semestercourse_Click" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
    <p>
&nbsp;&nbsp;
    </p>
</body>
</html>
