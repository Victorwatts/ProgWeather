<%@ Page Title="Contact" Language="C#"  AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ProgWeather.Contact" %>
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
          <a href="EditWeather.aspx">Edit Weather Info</a>

</div>

    <br/>
    <br/>
    
    <div class="Contactstyle">

    <h2> Contact page.</h2>
        <h3> Address</h3>
    <address>
        Belmont Office Park<br />
        Belmont Rd, 
        Rondebosch, 
        Cape Town, 
        7700<br />
        <abbr title="Phone">P:</abbr>
         021 685 5021
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:wattsvictor2@gmail.com">wattsvictor2@gmail.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:wattsvictor2@gmail.com">wattsvictor2@gmail.com</a>
    </address>

        </div>
    </body>
</html>