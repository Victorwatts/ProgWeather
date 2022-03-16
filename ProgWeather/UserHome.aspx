<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="ProgWeather.UserHome" %>

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
.TextBoxStyle {
              position: absolute;
             left: 15px;
             width: 184px;
             padding-bottom: 2px;
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
   
    
         
        
            <div style="padding-left: 1%"><p>Welcome  <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                </p><p>Select 2 of your favourite cities from the list below. <br /> The selcected cities will display on your home page whenever you login  </p></div>

            <br />
       
        <div style="padding-left: 1%">
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            <br />
            <asp:Button  ID="Button1" runat="server" OnClick="Button1_Click" Text="Add to favourites " Width="140px" Height="30px" />&nbsp;
            <asp:Button  ID="Button3" runat="server" OnClick="Button3_Click" Text="refresh " Width="140px" Height="30px" />&nbsp;&nbsp;
            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style2" Height="181px" Width="847px">
                 <Columns>
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="InputDate" HeaderText="InputDate" SortExpression="InputDate"  />
                    <asp:BoundField DataField="MinTemperature" HeaderText="MinTemperature" SortExpression="MinTemperature"/>
                    <asp:BoundField DataField="MaxTemperature" HeaderText="MaxTemperature" SortExpression="MaxTemperature"/>
                    <asp:BoundField DataField="Precipitation" HeaderText="Precipitation" SortExpression="Precipitation"/>
                    <asp:BoundField DataField="Humidity" HeaderText="Humidity" SortExpression="Humidity"/>
                    <asp:BoundField DataField="WindSpeed" HeaderText="WindSpeed" SortExpression="WindSpeed"/>
                </Columns>
            </asp:GridView>
           
       

    </div>
        
        
        
 </form>
    <div class="auto-style4">
    </div>
</body>
</html>
