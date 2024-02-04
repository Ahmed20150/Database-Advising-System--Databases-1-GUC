<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor.aspx.cs" Inherits="WebApplication1.Advisor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style> 
    .main{
       
            padding: 10px;
            display:flex;
            justify-content:center;
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
    <form id="form1" runat="server" >
        <center>
        <center style=" border: 1px solid #dddddd; border-color:black; width:25%; margin-top:100px; justify-content:center" >
        <div class="main">
            <asp:Label runat="server" Text="SIGN IN" Font-Size="Larger"></asp:Label>
        </div>
        

        <div class="main">
            <asp:Label ID="Label1" runat="server" Text="ID: "></asp:Label> 
            <asp:TextBox ID="ID" runat="server" placeholder="eg. 1 "></asp:TextBox>
        </div>
        
        <div class="main">
            <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
            <asp:TextBox ID="Password" runat="server" placeholder="eg. abcdefghi"></asp:TextBox>
        </div>
        
         <div class="main">          
             <asp:Button ID="Advisor_login" runat="server" Text="Login" OnClick="Advisor_Login" />
         </div>
            
            <a>To register click</a>
            <a target="_self" href="Advisor_register.aspx"> here</a>
            <a>.</a>
        </center>
        </center>
    </form>
</body>
</html>
