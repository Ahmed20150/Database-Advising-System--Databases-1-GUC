<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grad_Plan.aspx.cs" Inherits="WebApplication1.Grad_Plan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grad Plan Edits</title>
<link rel="icon" href="guc logo.jpg" type="image/x-icon/">
    <style>

        body{
  /*   background: linear-gradient(109.6deg, rgb(177, 173, 219) 11.2%, rgb(245, 226, 226) 91.1%);*/
     margin: 0;
     padding: 0;
     height: 1020px;
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
            color: #333;
            animation: fadeIn 1.5s ease-out;
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
    transition: opacity 0.5s ease-in-out;
    }

    .visibleDiv {
        visibility: visible;
        opacity: 1;
        transition: opacity 0.5s ease-in-out;

    }
    .app-sidebar { 
            background-image: linear-gradient(68.8deg, rgba(0, 0, 0, 0.95) 1.8%, rgb(0, 55, 79) 31.8%, rgb(9, 93, 134) 56.2%, rgb(15, 155, 217) 89%);
        }

        .main-menu {
            color: rgba(255,255,255,0.7) !important;
        }
        .main-menu:hover {
           background: rgba(255,255,255,0.15) !important;
           color: #fff !important;
        }
        .fixed-header .app-main {
  padding-top: 60px
}

.app-sidebar {
  width: 280px;
  display: flex;
  z-index: 11;
  overflow: hidden;
  min-width: 280px;
  position: relative;
  flex: 0 0 280px;
  margin-top: -60px;
  padding-top: 60px;
  transition: all .2s
}

.app-sidebar .app-sidebar__inner {
  padding: 2px 1.5rem 1.5rem
}

.app-sidebar.sidebar-shadow {
  box-shadow: 7px 0 60px rgba(0,0,0,0.05)
}

.vertical-nav-menu {
  margin: 0;
  padding: 0;
  position: relative;
  list-style: none
}

.vertical-nav-menu::after {
  content: " ";
  pointer-events: none;
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  top: 0
}

.vertical-nav-menu .mm-collapsing {
  position: relative;
  height: 0;
  overflow: hidden;
  transition-timing-function: ease;
  transition-duration: .25s;
  transition-property: height, visibility
}


.vertical-nav-menu li a {
  display: block;
  line-height: 2.4rem;
  height: 2.4rem;
  padding: 0 1.5rem 0 45px;
  position: relative;
  border-radius: .25rem;
  color: #343a40;
  white-space: nowrap;
  transition: all .2s;
  margin: .1rem 0
}

.vertical-nav-menu li a:hover {
  background: #e0f3ff;
  text-decoration:none;
}


.vertical-nav-menu i.metismenu-state-icon {
  transition: transform 300ms;
  left: auto;
  right: 0
}

.vertical-nav-menu ul {
  transition: padding 300ms;
  padding: .5em 0 0 2rem
}

.vertical-nav-menu ul:before {
  content: '';
  height: 100%;
  opacity: 1;
  width: 3px;
  background: #e0f3ff;
  position: absolute;
  left: 20px;
  top: 0;
  border-radius: 15px
}


.fixed-sidebar .app-sidebar {
  position: fixed;
  height: 1050px;
}

.closed-sidebar .app-sidebar {
  transition: all .3s ease;
  width: 80px;
  min-width: 80px;
  flex: 0 0 80px;
  z-index: 13
}


.closed-sidebar .app-sidebar .app-sidebar__inner ul li a {
  text-indent: -99rem;
  padding: 0
}

.closed-sidebar .app-sidebar .app-sidebar__inner .metismenu-icon {
  text-indent: 0;
  left: 50%;
  margin-left: -17px
}

.closed-sidebar .app-sidebar .app-sidebar__inner .metismenu-state-icon {visibility: hidden}
.closed-sidebar .app-sidebar .app-sidebar__inner ul::before {display: none}
.closed-sidebar .app-sidebar .app-sidebar__inner ul.mm-show {padding: 0}
.closed-sidebar .app-sidebar .app-sidebar__inner ul.mm-show>li>a {height: 0}

.closed-sidebar .app-sidebar:hover {
  flex: 0 0 280px !important;
  width: 280px !important
}


.closed-sidebar .app-sidebar:hover .app-sidebar__inner ul li a {
  text-indent: initial;
  padding: 0 1.5rem 0 45px
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
<script>

        function toggleDiv() {
            var animatedDiv = document.getElementById('animatedDiv');
            animatedDiv.classList.toggle('hiddenDiv');
            animatedDiv.classList.toggle('visibleDiv');
        }

    function toggleDiv1() {
        var animatedDiv = document.getElementById('animatedDiv1');
        animatedDiv.classList.toggle('hiddenDiv');
        animatedDiv.classList.toggle('visibleDiv');
    }
    function toggleDiv2() {
        var animatedDiv = document.getElementById('animatedDiv2');
        animatedDiv.classList.toggle('hiddenDiv');
        animatedDiv.classList.toggle('visibleDiv');
    }
    function toggleDiv3() {
        var animatedDiv = document.getElementById('animatedDiv3');
        animatedDiv.classList.toggle('hiddenDiv');
        animatedDiv.classList.toggle('visibleDiv');
    }
</script>
</head>
<body>
    <form id="form1" runat="server" style="display:flex; flex-direction:row;">
              
        <div class="app-container app-theme-white body-tabs-shadow fixed-header fixed-sidebar closed-sidebar-mobile closed-sidebar" style= "display:flex; flex-direction:row;" >          
            <div class="app-main">
            <div class="app-sidebar sidebar-shadow">
            <div class="scrollbar-sidebar ps">
            <div class="app-sidebar__inner">
            <ul style="font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;" class="vertical-nav-menu metismenu">
            <li class="" >
            <a href="Advisor_start_page.aspx" class="main-menu " aria-expanded="false">
            <i class="metismenu-icon pe-7s-add-user" ></i>
            Home</a>     
            </li>
            <li class="">
            <a href="Grad_Plan.aspx" class="main-menu " aria-expanded="true">
            <i class="metismenu-icon pe-7s-browser"></i>
            Grad Plan</a>
            </li>
            <li class="">
            <a href="View_student.aspx" class="main-menu " aria-expanded="true">
            <i class="metismenu-icon pe-7s-browser"></i>
            View Students
            </a>
            </li>
            <li class="">
            <a href="Pemding_Requests.aspx" class="main-menu " aria-expanded="false">
            <i class="metismenu-icon pe-7s-note"></i>
            View/edit Requests</a>
            </li>
            </ul>
            </div>
            </div>
            </div>    
            </div>
            </div>
        <center style="margin-left:auto; margin-right:auto" > 
            <label style="font-size:x-large; "> GRADUATION PLAN EDITS</label>
        <div  style= "margin:25px; display:flex; flex-direction:row; align-items:center; justify-content:center">
            <div  style= "margin:25px; display:flex; flex-direction:column; align-items:center; justify-content:center"">
            <asp:Button runat="server" CssClass="button" OnClientClick="toggleDiv(); return false;" Text="Add New Plan"></asp:Button>
                <div id="animatedDiv" class="hiddenDiv">
                <div> <asp:Label runat="server" Text="Semester Code:"></asp:Label>
                   <asp:TextBox ID="semcode" runat="server" placeholder="eg. W21"></asp:TextBox> </div>
                <div> <asp:Label runat="server" Text="Expected Graduation Date:"></asp:Label> 
                   <asp:TextBox ID="EGD" runat="server" placeholder="eg. 31/10/2020"></asp:TextBox> </div>
                <div> <asp:Label runat="server" Text="Sem Credit Hours:"></asp:Label> 
                  <asp:TextBox ID="SCH" runat="server" placeholder="eg. 26"></asp:TextBox> </div>
                <div> <asp:Label runat="server" Text="Student ID:"></asp:Label> 
                   <asp:TextBox ID="StudID" runat="server" placeholder="eg. 69"></asp:TextBox> </div>
            <div> <asp:Button ID="Button1" runat="server" Text="Insert" onclick="newgrad"/>  </div>
            </div>
                </div>
            <div  style= "margin:25px; display:flex; flex-direction:column; align-items:start; justify-content:center; margin-bottom:49px;">
            <asp:Button runat="server" CssClass="button" OnClientClick="toggleDiv1(); return false;" Text="Add Course To Grad Plan"></asp:Button>
               <div id="animatedDiv1" class="hiddenDiv">
               <div> <asp:Label runat="server" Text="Student ID:"></asp:Label> 
                    <asp:TextBox ID="StudID2" runat="server" placeholder="eg. 4"></asp:TextBox> </div>
               <div> <asp:Label runat="server" Text="Semester Code:"></asp:Label> 
                    <asp:TextBox ID="Semcode2" runat="server" placeholder="eg. W22"></asp:TextBox> </div>
               <div> <asp:Label runat="server" Text="Course Name:"></asp:Label> 
                     <asp:TextBox ID="CouNam" runat="server" placeholder="eg. Data Structures"></asp:TextBox> </div>
                <div> <asp:Button ID="Button2" runat="server" Text="Insert" onclick="newcougrad"/>  </div>
                
                </div>
                </div>
              </div>
        <div  style= "margin:25px; display:flex; flex-direction:row; align-items:center; justify-content:center">
          
            <div  style= "margin:25px; display:flex; flex-direction:column; align-items:start; justify-content:center">
            <asp:Button runat="server" CssClass="button" OnClientClick="toggleDiv2(); return false;" Text="Update Expected Grad Plan"></asp:Button>
               <div id="animatedDiv2" class="hiddenDiv">
                <div> <asp:Label runat="server" Text="Expected Grad Date:"></asp:Label> 
                     <asp:TextBox ID="EGD2" runat="server" placeholder="eg. 01/01/2020"></asp:TextBox> </div>
               <div> <asp:Label runat="server" Text="Student ID:"></asp:Label> 
                    <asp:TextBox ID="StudID3" runat="server" placeholder="eg. 4"></asp:TextBox> </div>
                <div> <asp:Button ID="button4" runat="server" Text="Update" onclick="updategrad"/>  </div>

                </div>
                </div>
           <div  style= "margin:25px; display:flex; flex-direction:column; align-items:start; justify-content:center; margin-top:47px;">
                <asp:Button runat="server" CssClass="button" OnClientClick="toggleDiv3(); return false;" Text="Delete Course from Grad Plan"></asp:Button>
           <div id="animatedDiv3" class="hiddenDiv">
            <div> <asp:Label runat="server" Text="Student ID:"></asp:Label> 
                 <asp:TextBox ID="StudID4" runat="server" placeholder="eg. 4"></asp:TextBox> </div>
             <div> <asp:Label runat="server" Text="Semester Code:"></asp:Label> 
                  <asp:TextBox ID="Semcode4" runat="server" placeholder="eg. W22"></asp:TextBox> </div>
             <div> <asp:Label runat="server" Text="Course ID:"></asp:Label> 
                  <asp:TextBox ID="CouID4" runat="server" placeholder="eg. 6"></asp:TextBox> </div>
            <div> <asp:Button ID="Button3" runat="server" Text="Delete" onclick="deletecou"/>  </div>

    </div>
    </div>
    </div>
            
            
            

        </center>
    </form>

    
 <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>
</body>
</html>
