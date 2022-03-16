<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Retrieve.aspx.cs" Inherits="ProgWeather.Retrieve" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(document).ready(function () {
            $('.datepicker-field').datepicker();
        });
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 897px;
            padding-left: 2%;
        }
        .auto-style2 {
            margin-right: 26px;
        }
        .auto-style3 {
            width: 901px;
        }
        .auto-style4 {
            width: 1436px;
        }
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
    </style>

</head>
<body style="height: 640px">
     <div class="topnav">
  <a class="active"> User: <asp:Label ID="lbl_Session" runat="server" Text="Label" ></asp:Label></a>
   <a href="UserHome.aspx">Home</a>
  <a href="Contact.aspx">Contact</a>
  <a href="About.aspx">About</a>
  <a href="Retrieve.aspx">Retrieve Weather Info</a>
  <a href="Insert.aspx">Insert Weather Info</a>
          <a href="EditWeather.aspx">Edit Weather Info</a>
 
  
 
</div>
    
    <form id="form1" runat="server">
   
        <div style="padding: 0.5%">
         <asp:Button  ID="Button2" runat="server" OnClick="Button2_Click" Text="Logout" Width="140px" Height="30px" />
       </div>
    <br/>
    <br/>
    
         
        <div> 
            <div><p>Welcome  <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                </p></div>

            <asp:Label ID="Label1" runat="server" Text="City:"></asp:Label>&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Width="156px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>&nbsp;&nbsp;

             <asp:Label ID="Label2" runat="server" Text="Start date:"></asp:Label>&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Width="156px" OnTextChanged="TextBox2_TextChanged" cssclass="datepicker-field"></asp:TextBox>&nbsp;&nbsp;

             <asp:Label ID="Label3" runat="server" Text="End date:"></asp:Label>&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" Width="156px" OnTextChanged="TextBox3_TextChanged" cssclass="datepicker-field"></asp:TextBox>&nbsp;
            
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" Width="122px" />&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Get all" Width="122px" />
            
        </div>
        <br />
        <div></div>

        <div class="auto-style3">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style2" Height="181px" Width="847px">
                 <Columns>
                    <asp:BoundField DataField="City" HeaderText="City" ReadOnly="True"/>
                    <asp:BoundField DataField="InputDate" HeaderText="Date"  />
                    <asp:BoundField DataField="MinTemperature" HeaderText="Minimum Temperature (°C)"/>
                    <asp:BoundField DataField="MaxTemperature" HeaderText="Maximum Temperature (°C)"/>
                    <asp:BoundField DataField="Precipitation" HeaderText="Precipitation (mm)"/>
                    <asp:BoundField DataField="Humidity" HeaderText="Humidity (%)"/>
                    <asp:BoundField DataField="WindSpeed" HeaderText="Wind Speed (km/h)"/>
                </Columns>
            </asp:GridView>
             </div>
 </form>
    <div class="auto-style4">
    </div>
</body>
</html>
