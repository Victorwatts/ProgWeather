<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProgWeather.Login" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
        .LabelStyle{    
         position: absolute;
             left: 15px;
             width: 186px;
             padding-bottom: 2px;
         }
         .TextBoxStyle {
             position: absolute;
             left: 120px;
             width: 184px;
             padding-bottom: 2px;
         }
        
        .content {
        max-width: 500px;
         margin: auto;
        }
        .auto-style1 {
            position: absolute;
            left: 120px;
            width: 184px;
            padding-bottom: 2px;
            top: 235px;
        }
    </style>
</head>
<body>
    <div class="topnav">
  <a class="active" href="Login.aspx">Login</a>
</div>
    <br/>
    <br/>
    <br/>
    <div class="content">
    <form id="form1" runat="server">
        <div >
            <asp:Label ID="Label1" runat="server" Text="User Name:" CssClass="LabelStyle"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBoxStyle"></asp:TextBox>
        </div><br/><br/>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Password:" CssClass="LabelStyle"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBoxStyle" TextMode="Password"></asp:TextBox>
        </div><br/><br/>
        <div>
        <asp:Button ID="Button1" runat="server" Text="Login" CssClass="TextBoxStyle" OnClick="Button1_Click"/>
            <br/><br/>
        <asp:Button ID="Button2" runat="server" Text="Register new user" CssClass="TextBoxStyle" OnClick="Button2_Click"/>


             <p>
            
                 <asp:Label ID="Label3" runat="server" Text="."></asp:Label>
            
        </p>
            </div>
        
    </form>
        </div>
</body>
</html>
