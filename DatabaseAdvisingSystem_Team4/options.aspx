<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="options.aspx.cs" Inherits="WebApplication1.options" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Admin Component 1</title>
    <link rel="icon" href="guc logo.jpg" type="image/x-icon/">

    <style>

        body{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 19.5px;
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

         .backButton{
         position: absolute; 
         top: 0; 
          right: 0; 
          border: None; 
          width: 200px;          
          height: 35px;         
          background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
          transition: transform 0.3s ease;
          margin:15px;
          border-radius: 5px;
          color:black;
          font-weight:100;
          font-size:12px;
          font-family:Bahnschrift;
          letter-spacing:0.3px;
          --text-stroke-color: rgba(0,0,0,0.6);
          -webkit-text-stroke: 1px var(--text-stroke-color);  
      }

        .logout{
        position: absolute; 
         top: 0; 
          left: 0; 
          border: None; 
          width: 200px;          
          height: 35px;         
          background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
          transition: transform 0.3s ease;
          margin:15px;
          border-radius: 5px;
          color:black;
          font-weight:100;
          font-size:15px;
          font-family:Bahnschrift;
          letter-spacing:0.3px;
          --text-stroke-color: rgba(0,0,0,0.6);
          -webkit-text-stroke: 1px var(--text-stroke-color);  
        }

    .copyrights{
    position: absolute;
    bottom: 0;
    right: 0;
    margin: 10px; 
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
        
        h1 {
            font-size: 2em;
            text-align: center;
            color: slategrey;
            animation: focus-in-expand 1.0s ease-out;
        }

                   .focus-in-expand {
	-webkit-animation: focus-in-expand 0.8s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
	        animation: focus-in-expand 0.8s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
}

     .warning{
        font-size: 1.5em;
        text-align: center;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="column">

            
           <h1>Admin Component 1</h1>
           <asp:Label ID="warning" CssClass="warning" runat="server"/>

            <div class="row">

            <div class="column">
        

            <div class="element_container">
            <asp:Button ID="listing" runat="server" Text="lists" OnClick="listing_Click" />
             </div>




            <div class="element_container">
            <asp:Label runat="server">start date </asp:Label>
            <asp:TextBox ID="sdate" type="date" runat="server"></asp:TextBox>
 
            <asp:Label runat="server">End date </asp:Label>
            <asp:TextBox ID="edate" type="date" runat="server"></asp:TextBox>
 
            <asp:Label runat="server">Semester code </asp:Label>
            <asp:TextBox ID="semcode" runat="server"></asp:TextBox>
 
            <asp:Button ID="addsem" runat="server" Text="add new semester" OnClick="addsem_Click" />
            </div>
 



            <div class="element_container">
            <asp:Label runat="server">Major</asp:Label>
            <asp:TextBox ID="major" runat="server" ></asp:TextBox>
 
            <asp:Label runat="server">Semester</asp:Label>
            <asp:TextBox ID="semester" runat="server"></asp:TextBox>
 
            <asp:Label runat="server">Credit Hours</asp:Label>
            <asp:TextBox ID="credithour" runat="server"></asp:TextBox>
 
            <asp:Label runat="server">Course Name</asp:Label>
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
 
            <asp:Label runat="server">Is Offered</asp:Label>
            <asp:TextBox ID="offer" runat="server"></asp:TextBox>
 
            <asp:Button ID="addc" runat="server" Text="add course" OnClick="addc_Click" />
            </div>
 


            </div>


            <div class="column" >
            
            <div class="element_container">
            <asp:Label runat="server">Course ID</asp:Label>
            <asp:TextBox ID="course" runat="server"></asp:TextBox>
 
            <asp:Label runat="server">Instructor ID</asp:Label>
            <asp:TextBox ID="instructor" runat="server"></asp:TextBox>
 
            <asp:Label runat="server">Slot ID</asp:Label>
            <asp:TextBox ID="slot" runat="server"></asp:TextBox>
 
            <asp:Button ID="linkcts" runat="server" Text="link c t s" OnClick="linkcts_Click" />
            </div>


            <div class="element_container">
 
            <asp:Label runat="server">Student ID</asp:Label>
            <asp:TextBox ID="student1" runat="server"></asp:TextBox>
 
            <asp:Label runat="server">Advisor ID</asp:Label>
            <asp:TextBox ID="advisor1" runat="server"></asp:TextBox>
 
            <asp:Button ID="libksa" runat="server" Text="link s a" OnClick="libksa_Click" />
            </div>
 
            <div class="element_container">
            <asp:Label runat="server">Course ID</asp:Label>
            <asp:TextBox ID="course2" runat="server"></asp:TextBox>
 
            <asp:Label runat="server">Instructor ID</asp:Label>
            <asp:TextBox ID="instructor2" runat="server"></asp:TextBox>
 
            <asp:Label runat="server">Student ID</asp:Label>
            <asp:TextBox ID="student2" runat="server"></asp:TextBox>
 
            <asp:Label runat="server">Semester Code</asp:Label>
            <asp:TextBox ID="semester2" runat="server"></asp:TextBox>
 
            <asp:Button ID="linksci" runat="server" Text="link s c i" OnClick="linksci_Click" />
            </div>

            </div>
             </div>
         
            
            
           <asp:Button ID="comp2" runat="server" Text="Go to Admin Component 2 ⮕"  CssClass="backButton" OnClick="redirectAdminComp2"/>
              
            
            <asp:Button ID="Button1" runat="server" Text="Logout"  CssClass="logout" OnClick="logout"/>

                    <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>

        </div>
    </form>
</body>
</html>
