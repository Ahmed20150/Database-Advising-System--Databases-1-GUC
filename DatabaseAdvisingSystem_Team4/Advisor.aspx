<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor.aspx.cs" Inherits="WebApplication1.Advisor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Stylesheet" href="Student Component 1\StyleSheet.css"/>
    <title>Advisor Login</title>
    <link rel="icon" href="guc logo.jpg" type="image/x-icon/">
    <style> 
    .main{
       
            padding: 10px;
            display:flex;
            justify-content:center;
    }
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
    
   

    </style>
</head>
<body>
<form id="form1" runat="server" style=" display: flex;
  justify-content: center;
  align-items: center;
  min-height: 90vh;
 ">

  <section style="  position: absolute;
  width: 400px;
  background: #222;  
  z-index: 1000;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 40px;
  border-radius: 4px;
  box-shadow: 0 15px 35px rgba(0,0,0,9);">
  
  

    <div style="position: relative;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    gap: 40px;"> 

     <h2 style="font-size: 2em;color: #178ab6;text-transform: uppercase;">Sign In</h2> 
               


<style>
input:focus ~ i,input:valid ~ i
{
transform: translateY(-7.5px);
font-size: 0.8em;
color: #fff;
}

</style>
<div class="content" 
style="position: relative;width: 50%;display: flex;justify-content: center;align-items: center;flex-direction: column;gap: 40px;"> 
<div class="form" style="  width: 100%;display: flex;flex-direction: column;gap: 25px;"> 





<div class="inputBox"> 

<asp:TextBox ID="ID" runat="server" required=""
style="  position: relative;width: 100%;background: #333;border: none;outline: none;padding: 25px 10px 7.5px;border-radius: 4px;color: #fff;font-weight: 500;font-size: 1em;"></asp:TextBox>
<i style=" position: absolute;left: 0;padding: 15px 10px;font-style: normal;color: #aaa;transition: 0.5s;pointer-events: none;">
    ID</i> 
    
</div> 
    <div class="inputBox"> 
        
<asp:TextBox ID="Password" runat="server" type="password" required=""
style="  position: relative;width: 100%;background: #333;border: none;outline: none;padding: 25px 10px 7.5px;border-radius: 4px;color: #fff;font-weight: 500;font-size: 1em;"></asp:TextBox>
<i style=" position: absolute;left: 0;padding: 15px 10px;font-style: normal;color: #aaa;transition: 0.5s;pointer-events: none;">
    Password</i> 

</div> 
</div> 
</div> 

<asp:Button ID="login" runat="server" Text="Sign In"  style="position: relative;background: #333;border: none;outline: none;padding: 25px 10px 7.5px;border-radius:4px;padding: 10px;width:70%;margin:5px;background: #178ab6;color:#000;font-weight: 600;font-size: 1.35em;letter-spacing: 0.05em;cursor: pointer;
" onclick="Advisor_Login"/>
                <a href="Advisor_register.aspx"> Sign Up</a>
        <a href="Main_Page.aspx"> Back to Main</a>

</div>

     

      
  </section>
</form>
      <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>

</body>
</html>
