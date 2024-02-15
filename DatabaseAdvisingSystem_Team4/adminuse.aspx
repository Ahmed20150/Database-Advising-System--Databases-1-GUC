<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminuse.aspx.cs" Inherits="WebApplication1.adminuse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Viewing Page 1</title>
    <link rel="icon" href="guc logo.jpg" type="image/x-icon/">



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


                  .focus-in-expand {
	-webkit-animation: focus-in-expand 0.8s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
	        animation: focus-in-expand 0.8s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
}


           @-webkit-keyframes focus-in-expand {
  0% {
    letter-spacing: -0.5em;
    -webkit-filter: blur(12px);
            filter: blur(12px);
    opacity: 0;
  }
  100% {
    -webkit-filter: blur(0px);
            filter: blur(0px);
    opacity: 1;
  }
}
@keyframes focus-in-expand {
  0% {
    letter-spacing: -0.5em;
    -webkit-filter: blur(12px);
            filter: blur(12px);
    opacity: 0;
  }
  100% {
    -webkit-filter: blur(0px);
            filter: blur(0px);
    opacity: 1;
  }
}



     @keyframes fadeIn {
         0% {
             opacity: 0;
             transform: translateY(-20px);
         }
         100% {
             opacity: 1;
             transform: translateY(0);
         }
     }
      h1 {
     font-size: 2em;
     text-align: center;
     color: slategrey;
      font-weight:100;
      animation: focus-in-expand 1.0s ease-out;
      margin-top: 50px;
      margin-bottom: 70px;

  }

      
        .button{
        border: none; 
        width: 300px;          
        height: 100px;         
        transition: transform 0.3s ease;
/*        margin-bottom: 10px;
        margin-right: 5px;
        border-radius: 5px;*/
        background: radial-gradient(circle at 12.3% 19.3%, rgb(85, 88, 218) 0%, rgb(95, 209, 249) 100.2%);
        color:whitesmoke;
        font-weight:100;
        font-size:17px;
        font-family:Bahnschrift;
        letter-spacing:0.3px;
        --text-stroke-color: rgba(255,255,255,0.6);
        -webkit-text-stroke: 1px var(--text-stroke-color);       
        /*        animation: fadeIn 2.0s ease-out;*/
       }
     .button:hover {
     transform: scale(1.1);
     background: linear-gradient(120deg, #89f7fe 0%, #66a6ff 100%);
     -moz-box-shadow: 24px 10px 39px 10px rgba(62,66,66,0.22);
     box-shadow: 24px 10px 39px 10px rgba(62,66,66,0.22);
    }

         .backbutton{
        border: None; 
        width: 100px;          
        height: 40px;         
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        transition: transform 0.3s ease;
        margin-bottom: 10px;
        margin-right: 5px;
        border-radius: 5px;
        color:black;
        font-weight:100;
        font-size:17px;
        font-family:Bahnschrift;
        letter-spacing:0.3px;
        --text-stroke-color: rgba(0,0,0,0.6);
        -webkit-text-stroke: 1px var(--text-stroke-color);  

         }

         .backbutton:hover {
             transform: scale(1.1);
             background: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
         }








    </style>


</head>
<body>
    <form id="form1" runat="server">

         <div style=" display:flex;
   gap:5px;
   justify-content: space-between;
   align-items: center;
   flex-direction: column; ">
     <h1 style="font-weight:bold">Viewing Page 2</h1> </div>
 
        
<div style="display:flex;
 gap:30px;
 align-items: center;
 margin-bottom:40px;
 flex-direction: row;">
            <asp:Button ID="listadvisors" runat="server" Text="All Advisors " class="button" OnClick="listadvisors_Click" />
            <asp:Button ID="stad" runat="server" Text="All students with advisor" class="button" OnClick="stad_Click" />
            <asp:Button ID="pending" runat="server" Text="All pending requests" class="button" OnClick="pending_Click" />
            <asp:Button ID="intructorcourse" runat="server" Text="Instructors with Courses" class="button" OnClick="intructorcourse_Click" />
            <asp:Button ID="semestercourse" runat="server" class="button" Text="Semesters with offered courses" OnClick="semestercourse_Click" />



                    <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>
        </div>

 <div style="display:flex;
 gap:10px;
 justify-content: space-between;
  margin-bottom:40px;
 align-items: center;
 flex-direction: column;"> 
                    <asp:Button ID="back" runat="server" Text="Back" CssClass="backbutton" OnClick="redirectBack"/> </div>

    </form>

</body>
</html>
