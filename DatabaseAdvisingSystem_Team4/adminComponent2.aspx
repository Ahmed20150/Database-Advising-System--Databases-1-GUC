<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminComponent2.aspx.cs" Inherits="DatabaseAdvisingSystem_Team4.adminComponent2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Admin Component 2</title>
    <link rel="icon" href="guc logo.jpg" type="image/x-icon"/>
    <style>

        body{
            margin: 0;
            padding: 0;
            height: 100%;
            background-image: url('guc bg.jpg'); 
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

    .hiddenDiv {
    visibility: hidden;
    opacity: 0;
    transition: visibility 0.45s ease-in-out, opacity 0.5s ease-in-out;
    }

    .visibleDiv {
        visibility: visible;
        opacity: 1;
        transition: visibility 0.45s ease-in-out, opacity 0.5s ease-in-out;
    }
    .formContainer{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 10px;
    }

    .textbox{
       border-radius: 5px;
    }

     .submitButton{
    border: None; 
    width: 100px;          
    height: 20px;         
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    transition: transform 0.3s ease;
    margin-bottom: 10px;
    margin-right: 5px;
    border-radius: 5px;
    color:black;
    font-weight:100;
    font-size:12px;
    font-family:Bahnschrift;
    letter-spacing:0.3px;
    --text-stroke-color: rgba(0,0,0,0.6);
    -webkit-text-stroke: 1px var(--text-stroke-color);  

 }

    .submitButton:hover {
     transform: scale(1.1);
     background: linear-gradient(to right, #fff1eb 0%, #ace0f9 100%);
 }

    .column{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 19.5px;
    }

    .row{
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        gap: 50px;
    
    }

    .element_container{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap:20px;
/*        height: 190px;*/
       
    }

    .warning{
        font-size: 1.5em;
        text-align: center;
    }

   .label{
    --text-stroke-color: rgba(0,0,0,0.6);
    -webkit-text-stroke: 1px var(--text-stroke-color);  

    }

   .copyrights{
      position: absolute;
      bottom: 0;
      right: 0;
      margin: 10px; 
   }

   .backButton{
            position: absolute; 
            top: 0; 
            left: 0; 
            margin:15px;
            border: None; 
            width: 200px;          
            height: 35px;         
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            transition: transform 0.3s ease;
            margin-bottom: 10px;
            margin-right: 5px;
            border-radius: 5px;
            color:black;
            font-weight:100;
            font-size:12px;
            font-family:Bahnschrift;
            letter-spacing:0.3px;
            --text-stroke-color: rgba(0,0,0,0.6);
            -webkit-text-stroke: 1px var(--text-stroke-color);  
        }

   .backButton:hover {
     transform: scale(1.1);
     background: linear-gradient(to right, #fff1eb 0%, #ace0f9 100%);
 }




    </style>

    <script>


        function toggleDiv() {
            var animatedDiv = document.getElementById('animatedDiv');
            animatedDiv.classList.toggle('hiddenDiv');
            animatedDiv.classList.toggle('visibleDiv');
        }

        function toggleDiv2() {
            var animatedDiv2 = document.getElementById('animatedDiv2');
            animatedDiv2.classList.toggle('hiddenDiv');
            animatedDiv2.classList.toggle('visibleDiv');
        }

        function toggleDiv3() {
            var animatedDiv2 = document.getElementById('animatedDiv3');
            animatedDiv2.classList.toggle('hiddenDiv');
            animatedDiv2.classList.toggle('visibleDiv');
        }

        function toggleDiv4() {
            var animatedDiv2 = document.getElementById('animatedDiv4');
            animatedDiv2.classList.toggle('hiddenDiv');
            animatedDiv2.classList.toggle('visibleDiv');
        }

        function toggleDiv5() {
            var animatedDiv2 = document.getElementById('animatedDiv5');
            animatedDiv2.classList.toggle('hiddenDiv');
            animatedDiv2.classList.toggle('visibleDiv');
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">


        <div class="column">


            
            <h1 class="animatedDiv">Admin Component 2</h1>
            <asp:Label ID="warning" runat="server" Text="" CssClass="warning"></asp:Label>
<%--            <asp:HiddenField ID="flagID" runat="server" />--%>
            

            <div class="row">


            <div class="column">


            <div class="button" style="margin-bottom:125px"><asp:Button ID="Button4" CssClass="button" runat="server" Text="Viewing Page" onClick="ViewpageRedirect"/> </div>

            <br />




            <%--A)--%>
                <div class="element_container">
           <div style="font-weight:bold" > <asp:Button runat="server" CssClass="button" OnClientClick="toggleDiv(); return false;" Text="Delete Course and Related Slots"></asp:Button> </div>

            <div id="animatedDiv" class="hiddenDiv">
            <div class="formContainer">   
            <div> <asp:Label runat="server" Text="CourseID:" CssClass="label"></asp:Label> 
                <asp:TextBox ID="courseid" runat="server" placeholder="Input CourseID" CssClass="textbox"></asp:TextBox> </div>
            <div> <asp:Button ID="Button1" runat="server" Text="Delete Course" onClick="Procedures_AdminDeleteCourse" CssClass="submitButton"  />  </div>
                
            </div>
            </div>

             </div>

            <br />

            <%--B)--%>
            <div class="element_container">
            <div style="font-weight:bold"> <asp:Button   CssClass="button" OnClientClick="toggleDiv2(); return false;" runat="server" Text="Delete slot of Unoffered courses"></asp:Button> </div>

            <div id="animatedDiv2" class="hiddenDiv">
                <div class="formContainer">
                <div> <asp:Label runat="server" Text="Semester Code:" CssClass="label"></asp:Label>
                    <asp:TextBox ID="semcode" runat="server" placeholder="Input Semester Code" CssClass="textbox"></asp:TextBox> </div>
                <div> <asp:Button ID="Button2" runat="server" Text="Delete slot" onClick="Procedures_AdminDeleteSlots" CssClass="submitButton"/>  </div>
            </div>
            </div>
            </div>
            
            <br />

            </div>
            
            <div class="column">
            <%--C)--%>
            <div style="font-weight:bold">  <asp:Button  CssClass="button" OnClientClick="toggleDiv3(); return false;" runat="server" Text="Add Makeup Exam"></asp:Button> </div>

            <div id="animatedDiv3" class="hiddenDiv">
                <div class="formContainer">
                <div> <asp:Label runat="server" Text="Exam Type:" CssClass="label" ></asp:Label>
                    <asp:DropDownList ID="addMakeupdropdown" runat="server"> 
                            <asp:ListItem default="0" Text="Choose Exam Type" Value="0"></asp:ListItem>
                            <asp:ListItem Text="First Makeup" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Second Makeup" Value="2"></asp:ListItem>
                </asp:DropDownList>
                </div>
                

                <div> <asp:Label runat="server" Text="CourseID:" CssClass="label"></asp:Label>
                <asp:TextBox ID="makeupcourseid" runat="server" placeholder="Input CourseID" CssClass="textbox"></asp:TextBox> </div>

                <div> <asp:Label runat="server" Text="Date:" CssClass="label"/><asp:TextBox ID="makeupdate" runat="server" placeholder="Enter Date DD/MM/YYYY" CssClass="textbox" ></asp:TextBox></div>
                <div><asp:Button ID="Button3" runat="server" Text="Add Makeup" onClick="Procedures_AdminAddExam" CssClass="submitButton"/></div>
                
                
                </div>
                <br />
             
            </div>

            <%--D) is in another page (Student_payment)--%>

            <%--E)--%>
            <div style="font-weight:bold"> <asp:Button   CssClass="button" OnClientClick="toggleDiv4(); return false;" runat="server" Text="Issue Installment"></asp:Button> </div>

                  <div id="animatedDiv4" class="hiddenDiv">
                      <div class="formContainer">
                      <div> <asp:Label runat="server" Text="PaymentID:" CssClass="label"></asp:Label>
                          <asp:TextBox ID="paymentID" runat="server" placeholder="Input PaymentID" CssClass="textbox"></asp:TextBox> </div>
                      <div> <asp:Button ID="Button5" runat="server" Text="Issue" onClick="Procedures_AdminIssueInstallment" CssClass="submitButton"/>  </div>
                  </div>
                  </div>
  
                  <br />

            <%--F)--%>
            <div style="font-weight:bold"> <asp:Button   CssClass="button" OnClientClick="toggleDiv5(); return false;" runat="server" Text="Update Student Status"></asp:Button> </div>

                  <div id="animatedDiv5" class="hiddenDiv">
                      <div class="formContainer">
                      <div> <asp:Label runat="server" Text="StudentID:" CssClass="label"></asp:Label>
                          <asp:TextBox ID="studentID_status" runat="server" placeholder="Input StudentID" CssClass="textbox"></asp:TextBox> </div>
                      <div> <asp:Button ID="Button6" runat="server" Text="Update Status" onClick="Procedure_AdminUpdateStudentStatus" CssClass="submitButton"/>  </div>
                  </div>

                  </div>
  
                  <br />




        
          
        </div>
        </div>

                <div><asp:Button ID="Button7" runat="server" Text="🠐 Back to Admin Component 1" onClick="redirectAdminComp1" CssClass="backButton"/> </div>

        



        <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>

        </div>
         




    </form>
</body>
</html>
