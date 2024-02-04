<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grad_plans_and_advisors.aspx.cs" Inherits="DatabaseAdvisingSystem_Team4.grad_plans_and_advisors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Graduation Plans & Advisors</title>
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


 h1 {
     font-size: 2em;
     text-align: center;
     color: slategrey;
     animation: focus-in-expand 1.0s ease-out;
     margin-top: 50px;
     margin-bottom: 50px;

 }
      .styled-table {
       border-collapse: collapse;
       border-width:100px;
       background:whitesmoke;
       width: 100%;
       overflow-x:auto; max-width:1600px; overflow-y:auto; max-height:300px;
       margin-bottom:50px;
  }

        .styled-table th, .styled-table td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

       
  .button{
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
  margin-left:46%;

        }
         .button:hover {
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
          flex-direction: column;">
            <h1>All Graduation Plans</h1>

                    <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>


        </div>
    </form>
</body>
</html>
