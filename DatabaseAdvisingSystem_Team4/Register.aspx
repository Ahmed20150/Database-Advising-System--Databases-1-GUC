<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GUI.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>register Page</title>
<link rel="Stylesheet" href="StyleSheet.css"/>

</head>
<body style="background-color:#11261b; color:white;  height: 58px; font-family:Bahnschrift">
<form id="form1" runat="server">
<div style="direction: ltr; height: 159px">
<div style="font-display:block; font-size:36px">Student Registration</div>

<div style="display: flex;
flex-direction: row;">
<div  style="width: 100px">
<asp:Label ID="Label5" runat="server" Text="First Name" ></asp:Label>
</div>
<div>
<asp:TextBox ID="First_name" placeholder="First Name" runat="server"></asp:TextBox>
</div>
</div>


<div style="display: flex;
flex-direction: row;">
<div  style="width: 100px">
<asp:Label ID="Label1" runat="server" Text="Last Name" ></asp:Label>
</div>
<div>
<asp:TextBox ID="Last_name" placeholder="Last Name" runat="server" ></asp:TextBox>
</div>
</div>

<div style="display: flex;
flex-direction: row;">
<div  style="width: 100px">
<asp:Label ID="Label2" runat="server" Text="Email" ></asp:Label>
</div>
<div>
<asp:TextBox ID="Email" placeholder="example@mail.com" runat="server"></asp:TextBox>
</div>
</div>



    
<div style="display: flex;
flex-direction: row;">
<div  style="width: 100px">
<asp:Label ID="Label7" runat="server" Text="Password" ></asp:Label>
</div>
<div>
<asp:TextBox ID="Password" placeholder="password123" runat="server"></asp:TextBox>
</div>
</div>






<div style="display: flex;
flex-direction: row;">
<div  style="width: 100px">
<asp:Label ID="Label3" runat="server" Text="Faculty" ></asp:Label>
</div>
<div>
<asp:TextBox ID="Faculty" placeholder="MET, IET, etc." runat="server"></asp:TextBox>
</div>
</div>




<div style="display: flex;
flex-direction: row;">
<div  style="width: 100px">
<asp:Label ID="Label4" runat="server" Text="Major" ></asp:Label>
</div>
<div>
<asp:TextBox ID="Major" placeholder="CSEN, DMET, etc." runat="server"></asp:TextBox>
</div>
</div>



<div style="display: flex;
flex-direction: row;">
<div  style="width: 100px">
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
</form>
</body>
</html>
