<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advisor_start_page.aspx.cs" Inherits="WebApplication1.Advisor_start_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    .main1{
   
        padding: 10px;
}
body {
    margin: 0;
    font-family:"Segoe UI",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
    font-size: .88rem;
    line-height: 1.5;
    color: #ffffff;
     margin: 0;
 padding: 0;
 height: 760px;
 background-image: url('startpage.jpg'); 
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
.list-group-item {
    padding: .75rem 1.25rem;
    margin-bottom: -1px;
    background-color:transparent;
    border: 2px solid rgba(0,0,0,1);
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
u1, li {
    list-style: none;
    list-style-type: none;
}
    .app-sidebar { 
            background-image:  linear-gradient(68.8deg, rgba(0, 0, 0, 0.95) 1.8%, rgb(0, 55, 79) 31.8%, rgb(9, 93, 134) 56.2%, rgb(15, 155, 217) 89%);
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
  height: 100vh
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
    </style>

</head>
<body>
    <form id="form1" runat="server" style="display:flex; flex-direction:row">
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
      
        <div style="width:100%">
         <div style="text-align: center; font-size: 50px;">
         <asp:Label ID="Label1" runat="server" Text="Welcome Advisor" Font-Bold="true" Font-Size="X-Large" ></asp:Label>
        </div>   
        <div style="width: 500px; border-right: 0px;margin-left:auto; margin-right: auto">
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
              <div class="widget-content-left"><b>Email:</b></div>
              <div class="widget-content-right"><div runat="server" id="emailholder"></div></div>
          </div>
      </div>
  </li>

  <li class="list-group-item">
      <div class="widget-content">
          <div class="widget-content-wrapper">
              <div class="widget-content-left"><b>Office:</b></div>
              <div class="widget-content-right"><div runat="server" id="semholder"></div></div>
          </div>
      </div>
  </li>

 

</ul>

</div>
</div>
 
        
    </form>
</body>
</html>
