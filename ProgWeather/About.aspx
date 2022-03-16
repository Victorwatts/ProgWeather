<%@ Page Title="About" Language="C#"  AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ProgWeather.About" %>

<html>
<head runat="server">
     <title></title>
    <style type="text/css">
        body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #3368FF;
  color: white;
}
.Contactstyle{
    
     padding-left: 2%;
}
        </style>
    </head>
<body>
     <div class="topnav">
   <a class="active"> User: <asp:Label ID="lbl_Session" runat="server" Text="Label" ></asp:Label></a>
  <a href="UserHome.aspx">Home</a>
  <a href="Contact.aspx">Contact</a>
  <a href="About.aspx">About</a>
  <a href="Retrieve.aspx">Retrieve Weather Info</a>
  <a href="Insert.aspx">Insert Weather Info</a>
          <a href="hEditWeather.aspx">Edit Weather Info</a>

</div>

    <br/>
    <br/>
    
    <div class="Contactstyle">

    
    <h3> About.</h3>
        <h4>This application was made for a second year assignment by a student from Varsity College</h4>
        <h4><a href="https://localhost:44321/Login">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;This will direct you to the login page</h4>
        <h4><a href="https://localhost:44321/Contact">Contact</a>&nbsp;&nbsp;&nbsp;&nbsp;This will direct you to the contact page</h4>
        <h4><a href="https://localhost:44321/About">About</a>&nbsp;&nbsp;&nbsp;&nbsp;This will direct you to the about page (HERE)</h4>
        <h4><a href="https://localhost:44321/Retrieve">Retrieve Weather Info</a>&nbsp;&nbsp;&nbsp;&nbsp;This will direct you to the retieval page, where you will be able to see the weather data</h4>
        <h4><a href="https://localhost:44321/Insert">Insert Weather Info</a>&nbsp;&nbsp;&nbsp;&nbsp;This will direct you to the insert page, you will need the required privileges to use it </h4>
        <h4><a href="https://localhost:44321/EditWeather">Edit Weather Info</a>&nbsp;&nbsp;&nbsp;&nbsp;This will direct you to the edit page, you will need the required privileges to use it</h4>
        <h4><a href="https://localhost:44321/UserHome">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;This will direct you to the home page, where you will find the data for your favourite cities</h4>
   </div>
    </body>
</html>
