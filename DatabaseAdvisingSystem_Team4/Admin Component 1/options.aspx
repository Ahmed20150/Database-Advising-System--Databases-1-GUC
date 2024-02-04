<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="options.aspx.cs" Inherits="WebApplication1.options" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="listing" runat="server" Text="lists" OnClick="listing_Click" />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            start date<br />
            <asp:TextBox ID="sdate" type="date" runat="server"></asp:TextBox>
            <br />
            end date<br />
            <asp:TextBox ID="edate" type="date" runat="server"></asp:TextBox>
            <br />
            semcode<br />
            <asp:TextBox ID="semcode" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="addsem" runat="server" Text="add new semester" OnClick="addsem_Click" />
            <br />
            <br />
            major<br />
            <asp:TextBox ID="major" runat="server" ></asp:TextBox>
            <br />
            semester<br />
            <asp:TextBox ID="semester" runat="server"></asp:TextBox>
            <br />
            credit hour<br />
            <asp:TextBox ID="credithour" runat="server"></asp:TextBox>
            <br />
            name<br />
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <br />
            is offered<br />
            <asp:TextBox ID="offer" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="addc" runat="server" Text="add cource" OnClick="addc_Click" />
            <br />
            <br />
            <br />
            course id<br />
            <asp:TextBox ID="course" runat="server"></asp:TextBox>
            <br />
            instructor id<br />
            <asp:TextBox ID="instructor" runat="server"></asp:TextBox>
            <br />
            slot id<br />
            <asp:TextBox ID="slot" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="linkcts" runat="server" Text="link c t s" OnClick="linkcts_Click" />
            <br />
            <br />
            student id<br />
            <asp:TextBox ID="student1" runat="server"></asp:TextBox>
            <br />
            advisor id<br />
            <asp:TextBox ID="advisor1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="libksa" runat="server" Text="link s a" OnClick="libksa_Click" />
            <br />
            <br />
            <br />
            course id<br />
            <asp:TextBox ID="course2" runat="server"></asp:TextBox>
            <br />
            instructor id<br />
            <asp:TextBox ID="instructor2" runat="server"></asp:TextBox>
            <br />
            student id<br />
            <asp:TextBox ID="student2" runat="server"></asp:TextBox>
            <br />
            semester code<br />
            <asp:TextBox ID="semester2" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="linksci" runat="server" Text="link s c i" OnClick="linksci_Click" />
            <br />
            <br />
            <br />
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
</body>
</html>
