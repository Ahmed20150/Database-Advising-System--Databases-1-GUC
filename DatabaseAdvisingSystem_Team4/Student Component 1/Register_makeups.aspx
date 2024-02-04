<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register_makeups.aspx.cs" Inherits="GUI.Register_makeups"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <script>
        function getSelectedValue() {
            var selectElement = document.getElementById("options");
            var selectedValue = selectElement.value;
        
            if (selectedValue == "option1") { 
                var hf = document.getElementById("workaround");
                hf.value = "Register first makeup";
                for (var i = 0; i < selectElement.options.length; i++) {
                    if (selectElement.options[i].value === "option0") {
                        selectElement.remove(i); break;}}}
            if (selectedValue == "option2") {
                var hf = document.getElementById("workaround");
                hf.value = "Register second makeup";
                for (var i = 0; i < selectElement.options.length; i++) {
                    if (selectElement.options[i].value === "option0") {
                        selectElement.remove(i);break;}}}
            if (selectedValue == "option0") { cred.disabled = true; cred.value = ""; course.disabled = true; course.value = ""; }
            
            

        }
    </script>



    
<body style="background-color:#11261b; color:white;  height: 58px; font-family:Bahnschrift">
<form id="form1" runat="server">
<div style="direction: ltr; height: 159px">
<div style="font-display:block; font-size:36px; margin-bottom:20px">Register Makeup</div>






    

    
<div style="display: flex;
flex-direction: row;">
<div  style="width: 200px">
    Choose Your Makeup</div>
	<select default="option0" style="width:173px" id="options" onchange="getSelectedValue()" name="type">
        <option value="option0">-- Select an option --</option>
		<option value="option1">First Makeup</option>
		<option value="option2">Second Makeup</option>
	</select>
</div>


 
   


    

<div runat="server" style="display: flex; 
flex-direction: row;" id="semester_code">
<div  style="width: 200px">
<asp:Label ID="Label2" runat="server" Text="Semester Code" ></asp:Label>
</div>
</div>


    
<div runat="server" style="display: flex; 
flex-direction: row;" id="courseshere">
<div  style="width: 200px">
<asp:Label ID="Label6" runat="server" Text="Course ID" ></asp:Label>
</div>
</div>

       
    



<br/>
    <asp:Button ID="send" runat="server" Text="Send Request" class="signup" OnClick="Button1_Click"/>
    <br/>
    <asp:Button ID="back" runat="server" Text="Back" class="signup" OnClick="redirectBack"/>
    



    <asp:HiddenField ID="workaround" runat="server" />

</div>
</form>
</body>

</html>
