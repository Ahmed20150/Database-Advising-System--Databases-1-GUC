<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view course taught by specific instructor.aspx.cs" Inherits="DatabaseAdvisingSystem.view_course_taught_by_specific_instructor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Course</title>
    <link rel="Stylesheet" href="StyleSheet.css"/>
    
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

           .buttonContainer{
                display: flex;
                flex-direction: column;
                margin-top:20px;
                gap: 5px;
           }
    </style>
</head>





<form id="form1" runat="server">
<div style="direction: ltr; height: 159px">
<div style="font-display:block; font-size:36px; margin-bottom:20px">View Course Taught by Instructor </div>






    

    



 
   


 <div runat="server" style="display: flex; 
flex-direction: row;" id="courseshere">
<div  style="width: 200px">
<asp:Label ID="Label6" runat="server" Text="Course ID" ></asp:Label>
</div>
</div>   

<div runat="server" style="display: flex; 
flex-direction: row;" id="instructor_id">
<div  style="width: 200px">
<asp:Label ID="Label2" runat="server" Text="Instructor ID" ></asp:Label>
</div>
</div>


    


       
    


<div class="buttonContainer">
    <asp:Button ID="send" runat="server" Text="View" class="signup" OnClick="Button1_Click"/>

    <asp:Button ID="back" runat="server" Text="Back" class="signup" OnClick="redirectBack"/>
    </div>



</div>
</form>


</html>
