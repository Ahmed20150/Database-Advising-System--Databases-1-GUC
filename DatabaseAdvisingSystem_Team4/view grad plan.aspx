<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view grad plan.aspx.cs" Inherits="DatabaseAdvisingSystem.view_grad_plan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Graduation Plan</title>
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

 
                   body{
   margin: 0;
   padding: 0;
   height: 100vh;
    background-image: url('guc bg5.jpg'); 
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

           .buttonContainer{
                display: flex;
                flex-direction: column;
                margin-top:20px;
                gap: 5px;
           }
</style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="view graduation plan"></asp:Label>
    </form>
</body>
</html>
