<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_register.aspx.cs" Inherits="WebApplication1.Advisor_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Advisor Sign Up</title>
    <link rel="icon" href="guc logo.jpg" type="image/x-icon/">
    <style>
           body{
      margin: 0;
      padding: 0;
      height: 900px;
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
}
        
         .mainLayout{
     display: flex;
     flex-direction: column;
     justify-content: center;
     align-items: center;
     gap:10px;
     margin-top: 100px;
     margin-bottom: 50px;
     margin-left: 50px;
     margin-right: 50px;
     padding: 60px;
     background-color: rgb(255 255 255 / 0.3);
     border-radius: 10px;
     backdrop-filter: blur(10px);
     box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
     color: #fff;
     text-align: center;
     font-size: 20px;
     font-weight: 100;
     letter-spacing: 0.5px;
     font-family:Bahnschrift;
 }

    .copyrights{
   position: absolute;
   bottom: 0;
   right: 0;
   margin: 10px; 
   font-family:Bahnschrift;
   letter-spacing:0.3px;
   font-weight:100;
}
    .label{
        font-size: 20px;
        font-weight: 100;
        text-decoration:double;
        letter-spacing: 0.5px;
        font-family:Bahnschrift;
    }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        <center>
            <h1>Register Here</h1>
        <div class="mainLayout">
         <div  style="width: 150px;">
            <asp:Label ID="Label3" runat="server" Text="Name:"></asp:Label>
            <asp:TextBox ID="AvName" runat="server" placeholder="eg. Hamada Gasser "></asp:TextBox>
        </div>
        <div style="width: 150px;">
            <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="Password" runat="server" placeholder="eg. abcdefghi"></asp:TextBox>
        </div>
        <div style="width: 150px;">
            <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="Email" runat="server" placeholder="eg. hamada@hotmail.com"></asp:TextBox>
        </div>
        <div style="width: 150px;">
            <asp:Label ID="Label5" runat="server" Text="Office:"></asp:Label>
            <asp:TextBox ID="Office" runat="server" placeholder="eg. c7.306"></asp:TextBox>
        </div>
        
        <div style="width: 150px; margin-top:20px">
            <asp:Button ID="Register" runat="server" Text="Register" OnClick="regadvup" />
        </div>
        <div style="width: 150px;  margin-top:20px">
            <asp:Button ID="Return" runat="server" Text="Return" OnClick="Advisor_Redirect" />
        </div>
        </div>
        </center>
    </form>

      <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>
</body>
</html>
