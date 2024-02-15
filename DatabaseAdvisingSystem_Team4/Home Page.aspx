<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home Page.aspx.cs" Inherits="GUI.Home_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Home Page</title>
<link rel="icon" href="guc logo.jpg" type="image/x-icon/">
<%--<link rel="Stylesheet" href="Student Component 1\StyleSheet.css"/>--%>
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
      /*     display: flex;
        flex-direction: column;
        justify-content: center;    
        align-items: center;
        gap: 19.5px;*/

}

              .copyrights{
   position: absolute;
   bottom: 0;
   right: 0;
   margin: 10px; 
}
    </style>


</head>
<body >
    <form id="form1" runat="server" style="display:flex;flex-direction:column">


        <div class="copyrights">© All Copyrights Reserved to Team Sighs (2023)</div>

          <div class="app-container app-theme-white body-tabs-shadow fixed-header fixed-sidebar closed-sidebar-mobile closed-sidebar" >          
             <div class="app-main">
            <div class="app-sidebar sidebar-shadow">
                    <div class="scrollbar-sidebar ps">
                    <div class="app-sidebar__inner">
                      
    <ul style="font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;" class="vertical-nav-menu metismenu">
                                                       <li class="" >
    <a href="Login.aspx" class="main-menu">
        <i style="font-style: normal;" class="metismenu-icon"></i>
        Sign Out</a>     
</li>
        <li class="" >
    <a href="Request.aspx" class="main-menu">
        <i style="font-style: normal;" class="metismenu-icon">🗳️</i>
        Request</a>     
</li>
                                    <li class="" >
    <a href="Register_makeups.aspx" class="main-menu">
        <i style="font-style: normal;" class="metismenu-icon">📝</i>
        Register Makeup</a>     
</li>
                                    <li class="" >
    <a href="choose instructor for a certain course.aspx" class="main-menu">
        <i style="font-style: normal;" class="metismenu-icon">👨🏻‍🏫</i>
        Choose Instructor
    </a>     
</li>
                                                                <li class="" >
    <a href="view grad plan.aspx" class="main-menu">
        <i style="font-style: normal;" class="metismenu-icon">📄</i>
        Graduation Plan
    </a>     
</li>
                          <li class="">
                                <a href="#" class="main-menu " aria-expanded="true">
                                    <i style="font-style: normal;" class="metismenu-icon">✎</i>
                                    Courses
                                    
                                </a>
                                
       <ul class="mm-collapse mm-show">
        <li>
            <asp:Button ID="All" CssClass="abook" runat="server" Text="Slots of Course With Instructor" OnClick="All_Click"/>
        </li>

        
                 <li> 
                     <asp:Button ID="Requiredb" onclick="Required" CssClass="abook" runat="server" Text="Required Courses"/>

                 </li>

                 <li>
                  <asp:Button ID="Optionalb" onclick="Optional" CssClass="abook" runat="server" Text="Optional Courses"/>
               </li>
            
                 <li>
                    <asp:Button ID="Slotb" onclick="CS" CssClass="abook" runat="server" Text="Courses and Slots"/>
                 </li>
            
                 <li>
                    <asp:Button ID="Examb" onclick="Exam" CssClass="abook" runat="server" Text="Courses and Exams"/>
                 </li>
            
                 <li>
                    <asp:Button ID="Missingb" onclick="Missing" CssClass="abook" runat="server" Text="Missing Courses"/>
                 </li>
            
                 <li>
                    <asp:Button ID="Availableb" onclick="Available" CssClass="abook" runat="server" Text="Available Courses"/>
                 </li>
            
                 <li>
                    <asp:Button ID="Prerequisiteb" onclick="Prerequisite" CssClass="abook" runat="server" Text="Prerequisite Courses"/>
                 </li>        
    </ul>

                            </li>
                            </ul>

                    </div>
                </div>
            </div>    
                 
              
              </div>
           
           
       </div>
    













        <asp:HiddenField ID="workaround" runat="server" />


        <script>
    function getSelectedValue() {
        var selectElement = document.getElementById("ddl");
        var selectedValue = selectElement.value;
            var hf = document.getElementById("workaround");
            hf.value = selectedValue;}
        </script>





        <div runat="server" style="display:flex; flex-direction:row;">
            <div runat="server" id="tablemoment" style="margin-left:7%;">
                
                <asp:Button CssClass="bbook" ID="ButtnO" runat="server" Text="View" style="visibility:hidden;margin-left:100%" OnClick="Button1_Click"/>
                <asp:Button CssClass="bbook" ID="ButtnR" runat="server" Text="View" style="visibility:hidden;margin-left:100%" OnClick="Button2_Click"/>
                <asp:Button CssClass="bbook" ID="ButtnA" runat="server" Text="View" style="visibility:hidden;margin-left:100%" OnClick="Button3_Click"/>
                <asp:DropDownList ID="ddl" runat="server" onchange="getSelectedValue()"  style="visibility:hidden;margin-left:100%"></asp:DropDownList>
                <div runat="server" style="overflow-x:auto;max-width:800px" id="tablemomento"></div>
                
            </div>
            <style>
                .bbook{
                    margin-left:100%;
                }
            </style>

<div style="width: 500px; border-right: 0px;margin-left: auto">
<ul class="list-group">
  <li class="list-group-item">
      <div class="widget-content">
          <div class="widget-content-wrapper">
              <div class="widget-content-left"><b>Full Name:</b></div>
              <div class="widget-content-right"><div runat="server" id="nameholder"></div></div>
          </div>
      </div>
  </li>

  <li class="list-group-item">
      <div class="widget-content">
          <div class="widget-content-wrapper">
              <div class="widget-content-left"><b>ID:</b></div>
              <div class="widget-content-right"><div runat="server" id="idholder"></div></div>
          </div>
      </div>
  </li>

  <li class="list-group-item">
      <div class="widget-content">
          <div class="widget-content-wrapper">
              <div class="widget-content-left"><b>GPA:</b></div>
              <div class="widget-content-right"><div runat="server" id="gpaholder"></div></div>
          </div>
      </div>
  </li>

  <li class="list-group-item">
      <div class="widget-content">
          <div class="widget-content-wrapper">
              <div class="widget-content-left"><b>Email:</b></div>
              <div class="widget-content-right"><div runat="server" id="emailholder"></div></div>
          </div>
      </div>
  </li>

  <li class="list-group-item">
      <div class="widget-content">
          <div class="widget-content-wrapper">
              <div class="widget-content-left"><b>Semester:</b></div>
              <div class="widget-content-right"><div runat="server" id="semholder"></div></div>
          </div>
      </div>
  </li>
  <li class="list-group-item">
      <div class="widget-content">
          <div class="widget-content-wrapper">
              <div class="widget-content-left"><b>Acquired Hours:</b></div>
              <div class="widget-content-right"><div runat="server" id="acholder"></div></div>
          </div>
      </div>
  </li>
  <li class="list-group-item">
    <div class="widget-content">
        <div class="widget-content-wrapper">
            <div class="widget-content-left"><b>Assigned Hours:</b></div>
            <div class="widget-content-right"><div runat="server" id="ashholder"></div></div>
        </div>
    </div>
</li>
  <li class="list-group-item">
      <div class="widget-content">
          <div class="widget-content-wrapper">
              <div class="widget-content-left"><b>Major:</b></div>
              <div class="widget-content-right"><div runat="server" id="majorholder"></div></div>
          </div>
      </div>
  </li>
  <li class="list-group-item">
      <div class="widget-content">
          <div class="widget-content-wrapper">
              <div class="widget-content-left"><b>Faculty:</b></div>
              <div class="widget-content-right"><div runat="server" id="facholder"></div></div>
          </div>
      </div>
  </li>

  <li class="list-group-item">
      <div class="widget-content">
          <div class="widget-content-wrapper">
              <div class="widget-content-left">
                  <b>Phone Number:</b>
              </div>
              <div class="widget-content-right">
                <div runat="server" id="phoneholder" style="max-height:50px;overflow-y:auto;"></div>
                <asp:TextBox runat="server" id="PhoneNum" type="number"  BorderStyle="Dashed" placeholder="Add Phone Number"></asp:TextBox>
                  <asp:Button ID="addphone" runat="server" Text=" + " onClick="Add" /></div>
                  </div>

              </div>
  </li>
  <li class="list-group-item">
    <div class="widget-content">
        <div class="widget-content-wrapper">
            <div class="widget-content-left">
                <b>Advisor ID:</b>
            </div>
            <div class="widget-content-right">
                <div runat="server" id="adholder"></div>
            </div>
        </div>
    </div>
</li>

</ul>
    </div>
</div>
<style>
body {
    margin: 0;
    font-family:"Segoe UI",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
    font-size: .88rem;
    line-height: 1.5;
    color: #495057;
}

.list-group-item {
    padding: .75rem 1.25rem;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid rgba(0,0,0,0.15);
    border-right: none ;
    border-left: none ;

}
.list-group {
    display: flex;
    flex-direction: column;
    padding-left: 0;
    margin-bottom: 0
}
.widget-content .widget-content-wrapper {
    display: flex;
    flex: 1;
    position: relative;
    align-items: center
}
.widget-content .widget-content-right.widget-content-actions {
    visibility: hidden;
    opacity: 0;
    transition: opacity .2s
}
.widget-content .widget-content-right {
  margin-left: auto;
}
.top {
    display:flex;
    flex-direction:row;
}
u1, li {
    list-style: none;
    list-style-type: none;
}




.vertical-nav-menu ul {
  margin: 0;
  padding: 0;
  position: relative;
  list-style: none
}

.vertical-nav-menu i.metismenu-state-icon,.vertical-nav-menu i.metismenu-icon {
  text-align: center;
  width: 34px;
  height: 34px;
  line-height: 34px;
  position: absolute;
  left: 5px;
  top: 50%;
  margin-top: -17px;
  font-size: 1.5rem;
  opacity: .3;
  transition: color 300ms
}



.vertical-nav-menu ul>li>a, .vertical-nav-menu ul>li>.abook,.vertical-nav-menu ul>li>.main-menuabook{
  color: #6c757d;
  height: 2rem;
  line-height: 2rem;
  padding: 0 1.5rem 0
}

.vertical-nav-menu ul>li>a:hover,.vertical-nav-menu ul>li>.abook:hover,.vertical-nav-menu ul>li>.main-menuabook:hover {
  color: #3f6ad8
}

a,.abook, .main-menuabook {
  color: #3f6ad8;
  text-decoration: none;
  background-color: transparent;
  cursor:pointer;
}

a:hover, .abook:hover, .main-menuabook:hover{
  color: #0056b3;
  text-decoration: underline
}

a:not([href]):not([tabindex]) {
  color: inherit;
  text-decoration: none
}

a:not([href]):not([tabindex]):hover,a:not([href]):not([tabindex]):focus {
  color: inherit;
  text-decoration: none
}

a:not([href]):not([tabindex]):focus {
  outline: 0
}

        .app-sidebar { 
            background-image:linear-gradient(68.8deg, rgba(0, 0, 0, 0.95) 1.8%, rgb(0, 55, 79) 31.8%, rgb(9, 93, 134) 56.2%, rgb(15, 155, 217) 89%);
        }
        .main-menu, .main-menuabook{
            color: rgba(255,255,255,0.7) !important;
        }
        .main-menu:hover ,.main-menuabook:hover{
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


.vertical-nav-menu li a, .vertical-nav-menu li .abook {
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

.vertical-nav-menu li a:hover, .vertical-nav-menu li .abook:hover {
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
  height: 100vh
}

.closed-sidebar .app-sidebar {
  transition: all .3s ease;
  width: 80px;
  min-width: 80px;
  flex: 0 0 80px;
  z-index: 13
}


.closed-sidebar .app-sidebar .app-sidebar__inner ul li a, .closed-sidebar .app-sidebar .app-sidebar__inner ul li .abook{
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
.closed-sidebar .app-sidebar .app-sidebar__inner ul.mm-show>li>a,.closed-sidebar .app-sidebar .app-sidebar__inner ul.mm-show>li>.abook {height: 0}

.closed-sidebar .app-sidebar:hover {
  flex: 0 0 280px !important;
  width: 280px !important
}

.closed-sidebar .app-sidebar:hover .app-sidebar__inner .app-sidebar__heading {
  text-indent: initial
}

.closed-sidebar .app-sidebar:hover .app-sidebar__inner .app-sidebar__heading::before {
  display: none
}

.closed-sidebar .app-sidebar:hover .app-sidebar__inner ul::before {
  display: block
}

.closed-sidebar .app-sidebar:hover .app-sidebar__inner ul li a, .closed-sidebar .app-sidebar:hover .app-sidebar__inner ul li .abook  {
  text-indent: initial;
  padding: 0 1.5rem 0 45px
}

.closed-sidebar .app-sidebar:hover .app-sidebar__inner .metismenu-icon {
  text-indent: initial;
  left: 5px;
  margin-left: 0
}

.closed-sidebar .app-sidebar:hover .app-sidebar__inner .metismenu-state-icon {
  visibility: visible
}

.closed-sidebar .app-sidebar:hover .app-sidebar__inner ul ul li a, .closed-sidebar .app-sidebar:hover .app-sidebar__inner ul ul li .abook {
  padding-left: 1em
}
.abook{
    border:none;
    width:100%;
    text-align:start
}
.vertical-nav-menu .mm-collapse:not(.mm-show) {
  display: none
}

.sidebar-mobile-open .app-sidebar .app-sidebar__inner ul.mm-show {
  padding: .5em 0 0 2rem
}

.sidebar-mobile-open .app-sidebar .app-sidebar__inner ul.mm-show>li>a, .sidebar-mobile-open .app-sidebar .app-sidebar__inner ul.mm-show>li>.abook {
  height: 2rem;
  line-height: 2rem
}

.closed-sidebar .app-sidebar:hover .app-sidebar__inner ul.mm-show {
padding: .5em 0 0 2rem
}

.closed-sidebar .app-sidebar:hover .app-sidebar__inner ul.mm-show>li>a,.closed-sidebar .app-sidebar:hover .app-sidebar__inner ul.mm-show>li>.abook {
height: 2.3em
}

.styled-table {
    border-collapse: collapse;
    
}

.styled-table th, .styled-table td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}


</style>
    </form>
</body>
</html>
