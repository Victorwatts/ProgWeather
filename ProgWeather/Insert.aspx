<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="ProgWeather.Insert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
     <style type="text/css">
        .LabelStyle{    
         position: absolute;
             left: 15px;
             width: 186px;
             padding-bottom: 2px;
         }
        .LabelStyle2{    
         position: absolute;
             left: 15px;
             padding-bottom: 2px;
         }
        .LabelStyle3{    
         position: absolute;
             left: 170px;
             padding-bottom: 2px;
         }
         .TextBoxStyle {
              position: absolute;
             left: 175px;
             width: 184px;
             padding-bottom: 2px;
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
<body style="height: 373px">
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
    <form id="form1" runat="server">

        
        <div style="padding: 0.5%">
         <asp:Button  ID="Button2" runat="server" OnClick="Button2_Click" Text="Logout" Width="140px" Height="30px" />
       </div><br/><br/>
        
    <br/>
   
        <div style="padding-bottom: 2px;">
               <asp:Label ID="Label8" runat="server" Text="" CssClass="LabelStyle2"></asp:Label>
            </div> <br/><br/>
        <div>
            <div style="padding-bottom: 2px;">
               <asp:Label ID="Label1" runat="server" Text="City" CssClass="LabelStyle"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="text-align:center; " CssClass="TextBoxStyle" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
             </div> <br/><br/>
        <div style="padding-bottom: 2px;">
             <asp:Label ID="Label2" runat="server" Text="Date:" CssClass="LabelStyle"></asp:Label>&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" style="text-align:center; " CssClass="TextBoxStyle" TextMode="Date" OnTextChanged="TextBox2_TextChanged" ></asp:TextBox>
             </div> <br/>
         <div style="padding-bottom: 2px;">
             <asp:Label ID="Label3" runat="server" Text="Minimum Temprature:" CssClass="LabelStyle"></asp:Label>&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" style="text-align:center;" CssClass="TextBoxStyle" TextMode="Number" OnTextChanged="TextBox3_TextChanged" ></asp:TextBox>
         </div> <br/>
         <div style="padding-bottom: 2px;">
             <asp:Label ID="Label4" runat="server" Text="Maximum Temprature:" CssClass="LabelStyle"></asp:Label>&nbsp;
            <asp:TextBox ID="TextBox4" runat="server" style="text-align:center; " CssClass="TextBoxStyle" TextMode="Number" OnTextChanged="TextBox4_TextChanged" ></asp:TextBox>
         </div> <br/>
         <div style="padding-bottom: 2px;">
             <asp:Label ID="Label5" runat="server" Text="Precipitation:" CssClass="LabelStyle"></asp:Label>&nbsp;
            <asp:TextBox ID="TextBox5" runat="server" style="text-align:center; " CssClass="TextBoxStyle" TextMode="Number" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
         </div> <br/>
         <div style="padding-bottom: 2px;">
             <asp:Label ID="Label6" runat="server" Text="Humidity:" CssClass="LabelStyle"></asp:Label>&nbsp;
            <asp:TextBox ID="TextBox6" runat="server" style="text-align:center; " CssClass="TextBoxStyle" TextMode="Number" OnTextChanged="TextBox6_TextChanged" ></asp:TextBox>
          </div> <br/>
        <div style="padding-bottom: 2px;">
             <asp:Label ID="Label7" runat="server" Text="Wind Speed:" CssClass="LabelStyle"></asp:Label>&nbsp;
            <asp:TextBox ID="TextBox7" runat="server" style="text-align:center; " CssClass="TextBoxStyle" TextMode="Number" OnTextChanged="TextBox7_TextChanged"></asp:TextBox>
          </div> <br/>
        </div>
        <div>
        <asp:Button ID="InsertData" runat="server" Text="Insert"  CssClass="TextBoxStyle" OnClick="InsertData_Click"/>
            </div><br/><br/>
        <div>
            <asp:Label ID="Label9" runat="server" Text="" CssClass="LabelStyle3">></asp:Label>
        </div><br/><br/>
        <div><asp:Button ID="RetrieveData" runat="server" Text="Go to retrieval" CssClass="TextBoxStyle" OnClick="RetrieveData_Click" /></div>
       
        
       
    </form>
   
</body>
</html>
