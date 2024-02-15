<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewingPage.aspx.cs" Inherits="DatabaseAdvisingSystem_Team4.viewingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Viewing Page 2</title>
    <link rel="icon" href="guc logo.jpg" type="image/x-icon"/>
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
        margin-bottom: 10px;
        margin-right: 5px;
        border-radius: 5px;
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
        <div style=" display:flex;
          gap:5px;
          justify-content: space-between;
          align-items: center;
          flex-direction: column; ">
            <h1 style="font-weight:bold">Viewing Page 2</h1>

          <div style=" display:flex;
          gap:50px;
          justify-content: space-between;
          align-items: center;
          flex-direction: column; ">

          <div style="display:flex;
          gap:50px;
          justify-content: space-between;
          align-items: center;
          flex-direction: row;">

            <asp:Button ID="Button1" Cssclass="button" runat="server" Text="View Payment Details" OnClick="redirectViewPayments" />

            <asp:Button ID="Button2" Cssclass="button" runat="server" Text="View All Active Students" OnClick="redirectViewActiveStudents" />

             <asp:Button ID="Button4" Cssclass="button" runat="server" Text="View All Graduation Plans" OnClick="redirectViewGradPlansandAdvisors" />

             <%-- <asp:Button ID="Button7" Cssclass="button" runat="server" Text="View All Offered Courses" OnClick="redirectViewOfferedCourseswithSem" />--%>

              </div>

               <div style="display:flex;
                 gap:50px;
                 justify-content: space-between;
                 align-items: center;
                 flex-direction: row;
                 margin-bottom:40px"
                   >

              <asp:Button ID="Button5" Cssclass="button" runat="server" Text="View All Transcripts" OnClick="redirectViewTranscripts" />

               <asp:Button ID="Button6" Cssclass="button" runat="server" Text="View All Offered Courses" OnClick="redirectViewOfferedCourseswithSem" />

                </div>
            


           </div>


            <div> <asp:Button ID="Button3" runat="server" Cssclass="backbutton" Text="Back" OnClick="redirectBack" /></div>



        <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>








        </div>
    </form>
</body>
</html>
