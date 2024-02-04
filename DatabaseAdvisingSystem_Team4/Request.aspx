<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="GUI.Request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Request</title>
    <link rel="Stylesheet" href="StyleSheet.css"/>
</head>

    <script>
        function getSelectedValue() {
            var selectElement = document.getElementById("options");
            var selectedValue = selectElement.value;
            var course = document.getElementById("Course");
            var cred = document.getElementById("Cred");
            if (selectedValue == "option2") {
                yourmom.disabled = false; cred.disabled = true; cred.value = ""; 
                var hf = document.getElementById("workaround");
                hf.value = "Add course";
                for (var i = 0; i < selectElement.options.length; i++) {
                    if (selectElement.options[i].value === "option0") {
                        selectElement.remove(i); break;}}}
            if (selectedValue == "option1") { cred.disabled = false;
                yourmom.value = "-- Select Your Course --"; yourmom.disabled = true;
                var hf = document.getElementById("workaround");
                hf.value = "Add credit hours";
                for (var i = 0; i < selectElement.options.length; i++) {
                    if (selectElement.options[i].value === "option0") {
                        selectElement.remove(i);break;}}}
            if (selectedValue == "option0") { cred.disabled = true; cred.value = ""; course.disabled = true; course.value = ""; }
            
            

        }
    </script>



<body style="background-color:#11261b; color:white;  height: 58px; font-family:Bahnschrift">
<form id="form1" runat="server">
<div style="direction: ltr; height: 159px">
<div style="font-display:block; font-size:36px; margin-bottom:20px">Sending Request</div>






    

    
<div style="display: flex;
flex-direction: row;">
<div  style="width: 100px">
<asp:Label ID="Label2" runat="server" Text="Type" ></asp:Label>
</div>
	<select default="option0" style="width:173px" id="options" onchange="getSelectedValue()" name="type">
        <option value="option0">-- Select an option --</option>
		<option value="option1">Add Credit Hours</option>
		<option value="option2">Add Course</option>
	</select>
</div>


 
   


    
<div style="display: flex;
flex-direction: row;">
<div  style="width: 100px">
<asp:Label ID="Label3" runat="server" Text="Credit Hours" ></asp:Label>
</div>
<div>
<asp:TextBox ID="Cred" disabled="true" placeholder="max. 3" runat="server"></asp:TextBox>
</div>
</div>


    
<div runat="server" style="display: flex; 
flex-direction: row;" id="courseshere">
<div  style="width: 100px">
<asp:Label ID="Label6" runat="server" Text="Course ID" ></asp:Label>
</div>
<div>

</div>
</div>

       
    
<div style="display: flex;
flex-direction: row;">
<div  style="width: 100px">
<asp:Label ID="comment" runat="server" Text="Comment" ></asp:Label>
</div>
<div>
<asp:TextBox ID="commentmoment" placeholder="Add a comment" runat="server"></asp:TextBox>
</div>
</div>


<br/>
    <asp:Button ID="send" runat="server" Text="Send Request" class="signup" OnClick="Button1_Click"/>
    <br/>
    <asp:Button ID="back" runat="server" Text="Back" class="signup" OnClick="redirectBack"/>
    



    <asp:HiddenField ID="workaround" runat="server" />
    <asp:HiddenField ID="workaround2" runat="server" />

</div>
</form>
</body>

</html>
