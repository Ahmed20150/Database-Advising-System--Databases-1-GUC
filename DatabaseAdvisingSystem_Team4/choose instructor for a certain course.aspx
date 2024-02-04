<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="choose instructor for a certain course.aspx.cs" Inherits="DatabaseAdvisingSystem.choose_instructor_for_a_certain_course" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Request</title>
    <link rel="Stylesheet" href="StyleSheet.css"/>
</head>

   



<body style="background-color:#11261b; color:white;  height: 58px; font-family:Bahnschrift">
<form id="form1" runat="server">
<div style="direction: ltr; height: 159px">
<div style="font-display:block; font-size:36px; margin-bottom:20px">Choose Instructor</div>





<div runat="server" style="display: flex; 
flex-direction: row;" id="instructor_id">
<div  style="width: 200px">
<asp:Label ID="Label1" runat="server" Text="Instructor ID" ></asp:Label>
</div>
</div> 



<div runat="server" style="display: flex; 
flex-direction: row;" id="courseshere">
<div  style="width: 200px">
<asp:Label ID="Label6" runat="server" Text="Course ID" ></asp:Label>
</div>
</div>

    

<div runat="server" style="display: flex; 
flex-direction: row;" id="semester_code">
<div  style="width: 200px">
<asp:Label ID="Label2" runat="server" Text="Semester Code" ></asp:Label>
</div>
</div>


    


       
    



<br/>
    <asp:Button ID="send" runat="server" Text="Choose" class="signup" OnClick="Button1_Click"/>
    <br/>
    <asp:Button ID="back" runat="server" Text="Back" class="signup" OnClick="redirectBack"/>
    



</div>
</form>
</body>

</html>

