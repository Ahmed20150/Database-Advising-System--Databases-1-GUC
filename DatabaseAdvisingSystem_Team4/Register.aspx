<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GUI.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Student Register</title>
<link rel="icon" href="guc logo.jpg" type="image/x-icon/">
<link rel="Stylesheet" href="StyleSheet.css"/>

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
}

    .mainLayout{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap:5px;
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
    </style>

</head>
<body>
<form id="form1" runat="server">
<div style="direction: ltr; height: 159px">
<div style="font-display:block; font-size:36px; display:flex; align-items:center; justify-content:center">Student Registration</div>

<div class="mainLayout">
<div style="display: flex;
flex-direction: row;">
<div  style="width: 150px;">
<asp:Label ID="Label5" runat="server" Text="First Name" ></asp:Label>
</div>
<div>
<asp:TextBox ID="First_name" placeholder="First Name" runat="server"></asp:TextBox>
</div>
</div>


<div style="display: flex;
flex-direction: row; ">
<div style="width: 150px">
<asp:Label ID="Label1" runat="server" Text="Last Name" ></asp:Label>
</div>
<div>
<asp:TextBox ID="Last_name" placeholder="Last Name" runat="server" ></asp:TextBox>
</div>
</div>

<div style="display: flex;
flex-direction: row;">
<div  style="width: 150px">
<asp:Label ID="Label2" runat="server" Text="Email" ></asp:Label>
</div>
<div>
<asp:TextBox ID="Email" placeholder="example@mail.com" runat="server"></asp:TextBox>
</div>
</div>



    
<div style="display: flex;
flex-direction: row;">
<div  style="width: 150px">
<asp:Label ID="Label7" runat="server" Text="Password" ></asp:Label>
</div>
<div>
<asp:TextBox ID="Password" placeholder="password123" runat="server"></asp:TextBox>
</div>
</div>






<div style="display: flex;
flex-direction: row;">
<div  style="width: 150px">
<asp:Label ID="Label3" runat="server" Text="Faculty" ></asp:Label>
</div>
<div>
<asp:TextBox ID="Faculty" placeholder="MET, IET, etc." runat="server"></asp:TextBox>
</div>
</div>




<div style="display: flex;
flex-direction: row;">
<div  style="width: 150px">
<asp:Label ID="Label4" runat="server" Text="Major" ></asp:Label>
</div>
<div>
<asp:TextBox ID="Major" placeholder="CSEN, DMET, etc." runat="server"></asp:TextBox>
</div>
</div>



<div style="display: flex;
flex-direction: row;">
<div  style="width: 150px">
<asp:Label ID="Label6" runat="server" Text="Semester" ></asp:Label>
</div>
<div>
<asp:TextBox ID="Semester" placeholder="Semester" runat="server"></asp:TextBox>
</div>
</div>




<br/>
<asp:Button ID="registerb" runat="server" Text="Sign Up" onClick="signup" class="signup"/>
    <br/>
<asp:Button ID="Button1" runat="server" Text="back to Login Page" onClick="backgo" class="signup"/>

</div>


    </div>
</form>

      <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>
</body>
</html>
