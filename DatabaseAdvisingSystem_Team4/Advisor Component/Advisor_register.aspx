<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_register.aspx.cs" Inherits="WebApplication1.Advisor_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    .main{
   
        padding: 10px;
}
        body{

              
 /*   background: linear-gradient(109.6deg, rgb(177, 173, 219) 11.2%, rgb(245, 226, 226) 91.1%);*/
    margin: 0;
    padding: 0;
    height: 760px;
    background-image: url('guc_bg2.jpg'); 
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-blend-mode:color-burn;
    background-color: rgb(255 255 255 / 0.3);
    backdrop-filter: blur(10px);
    font-family:Bahnschrift;
    letter-spacing:0.3px;
    font-weight:100;



}  
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        <center>
        <div style=" border: 1px solid #dddddd; border-color:black; width:25%; margin-top:100px; justify-content:center">
        <div class="main">
            <asp:Label ID="Label1" runat="server" Text="Register here"></asp:Label>
        </div>
         <div class="main">
            <asp:Label ID="Label3" runat="server" Text="Name:"></asp:Label>
            <asp:TextBox ID="AvName" runat="server" placeholder="eg. Hamada Gasser "></asp:TextBox>
        </div>
        <div class="main">
            <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="Password" runat="server" placeholder="eg. abcdefghi"></asp:TextBox>
        </div>
        <div class="main">
            <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="Email" runat="server" placeholder="eg. hamada@hotmail.com"></asp:TextBox>
        </div>
        <div class="main">
            <asp:Label ID="Label5" runat="server" Text="Office:"></asp:Label>
            <asp:TextBox ID="Office" runat="server" placeholder="eg. c7.306"></asp:TextBox>
        </div>
        
        <div class="main">
            <asp:Button ID="Register" runat="server" Text="Register" OnClick="regadvup" />
        </div>
        <div class="main">
            <asp:Button ID="Return" runat="server" Text="Return" OnClick="Advisor_Redirect" />
        </div>
        </div>
        </center>
    </form>
</body>
</html>
