<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main_Page.aspx.cs" Inherits="DatabaseAdvisingSystem_Team4.Main_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome Page</title>
    <link rel="icon" href="guc logo.jpg" type="image/x-icon/">
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
           img{
             width: 200px;
             height: 200px;
             animation: text-focus-in 1.0s ease-out;
        }

           h1 {
            font-size: 2em;
            text-align: center;
            color: black;
            animation: text-focus-in 1s ease-out;
                           animation-delay:1s;

        }
           h2{
              font-size: 2em;
               text-align: center;
                color: black;
               animation: text-focus-in 1s ease-out;
               animation-delay:2s;
           }
   
.text-focus-in {
	-webkit-animation: text-focus-in 1s cubic-bezier(0.550, 0.085, 0.680, 0.530) both;
	        animation: text-focus-in 1s cubic-bezier(0.550, 0.085, 0.680, 0.530) both;
}
        
@-webkit-keyframes text-focus-in {
  0% {
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
@keyframes text-focus-in {
  0% {
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
        .button{
        border: none; 
        width: 300px;          
        height: 50px;         
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
         .row{
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        gap: 50px;
    
    }
        .column{
        display: flex;
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
      font-family:Bahnschrift;
      letter-spacing:0.3px;
      font-weight:100;
   }
   .animation-container {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.image-container,
.text-container1,
.text-container2{
    opacity: 0;
    animation: text-focus-in 1s cubic-bezier(0.550, 0.085, 0.680, 0.530) both;
}

@keyframes text-focus-in {
    0% {
        filter: blur(12px);
        opacity: 0;
    }
    100% {
        filter: blur(0px);
        opacity: 1;
    }
}

.image-container {
    animation-delay: 0.2s; 
}

.text-container1 {
    animation-delay: 0.4s; 
}

.text-container2 {
    animation-delay: 0.6s; 
}








        </style>


</head>
<body>
    <form id="form1" runat="server">


        <div class="column">
           <div class="animation-container">
    <div class="image-container">
        <img src="GUC logo nobg.png" alt="GUC Campus Backdrop"/>
    </div>
    <div class="text-container1">
        <h1 class="text-focus-in">Welcome to The GUC Advising System</h1>
    </div>

    <div class="text-container2">
       <h2 class="text-focus-in">Log in As:</h2>  
   </div>
</div>
            <div class="row">

                <asp:Button  runat="server" CssClass="button" Text="Admin" OnClick="Admin_Redirect" />
                <asp:Button  runat="server" CssClass="button" Text="Student" OnClick="Student_Redirect" />
                <asp:Button  runat="server" CssClass="button" Text="Advisor" onclick="Advisor_Redirect"/>
            </div>
        </div>

    </form>

      <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>
</body>
</html>
