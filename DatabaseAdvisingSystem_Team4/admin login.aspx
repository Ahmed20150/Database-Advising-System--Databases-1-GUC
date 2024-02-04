<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin login.aspx.cs" Inherits="WebApplication1.admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
   
   body{
   margin: 0;
   padding: 0;
   height: 100vh;
   background-image: url('guc bg2.jpg'); 
   background-size: cover;
   background-position: center;
   background-repeat: no-repeat;
   background-blend-mode:color-burn;
   background-color: rgb(255 255 255 / 0.3);
   backdrop-filter: blur(10px);
   font-family:Bahnschrift;
   letter-spacing:0.3px;
   font-weight:100;
           display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 19.5px;

}
   .container{
background: linear-gradient(to top, #accbee 0%, #e7f0fd 100%);
display: flex;
          width:25%;
flex-direction: column;
justify-content: center;
align-items: center;
gap: 19.5px;
   }
   
    .copyrights{
    position: absolute;
    bottom: 0;
    right: 0;
    margin: 10px; 
 }



        </style>
</head>
<body>
    <form id="form1" class="container" runat="server">
        <h1>Admin Login</h1>
        <div >

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
            <a href="Main_Page.aspx"> Back to Main</a>


           <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>

        </div>
    </form>
</body>
</html>
