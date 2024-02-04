<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminuse.aspx.cs" Inherits="WebApplication1.adminuse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>



<style>

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
}


        .styled-table {
            border-collapse: collapse;
            width: 100%;
           margin-bottom:50px;
           background:whitesmoke;

        }

        .styled-table th, .styled-table td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;

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
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="listadvisors" runat="server" Text="list all advisors " OnClick="listadvisors_Click" />
            <asp:Button ID="stad" runat="server" Text="list student with thier advisor" OnClick="stad_Click" />
            <asp:Button ID="pending" runat="server" Text="list all pending requests" OnClick="pending_Click" />
            <asp:Button ID="intructorcourse" runat="server" Text="list instructors with their courses" OnClick="intructorcourse_Click" />
            <asp:Button ID="semestercourse" runat="server" Text="list all semesters with their offered courses" OnClick="semestercourse_Click" />

            <asp:Button ID="back" runat="server" Text="Back" OnClick="redirectBack"/>

                    <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>

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
