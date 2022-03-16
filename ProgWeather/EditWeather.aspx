<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditWeather.aspx.cs" Inherits="ProgWeather.EditWeather" %>

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
.Gridview
{
font-family:Verdana;
font-size:10pt;
font-weight:normal;
color:black;
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
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br/>
    
         
        <br />
        <div></div>

        <div>
            <asp:GridView ID="gvDetails" DataKeyNames="ID" runat="server"
AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8"
ShowFooter="true" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
onrowcancelingedit="gvDetails_RowCancelingEdit"
onrowdeleting="gvDetails_RowDeleting" onrowediting="gvDetails_RowEditing"
onrowupdating="gvDetails_RowUpdating"
onrowcommand="gvDetails_RowCommand" Width="1503px">
<Columns>
<asp:TemplateField>
<EditItemTemplate>
<asp:Button ID="imgbtnUpdate" Text="Update" CommandName="Update" runat="server"  ToolTip="Update" Height="20px" Width="50px" />
<asp:Button ID="imgbtnCancel" Text="cancel" runat="server" CommandName="Cancel"  ToolTip="Cancel" Height="20px" Width="50px" />
</EditItemTemplate>
<ItemTemplate>
<asp:Button ID="imgbtnEdit" Text="Edit" CommandName="Edit" runat="server"  ToolTip="Edit" Height="20px" Width="50px" />
<asp:Button ID="imgbtnDelete" CommandName="Delete" Text="Delete" runat="server" ToolTip="Delete" Height="20px" Width="50px" />
</ItemTemplate>
<FooterTemplate>
<asp:Button ID="imgbtnAdd" runat="server" Text="Add new"  CommandName="AddNew" Width="80px" Height="30px" ToolTip="Add new User"  ValidationGroup="validaiton" />
</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="City">
<EditItemTemplate>
<asp:TextBox ID="txtCity" runat="server" Text='<%#Eval("City") %>'/>
</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="lblCity" runat="server" Text='<%#Eval("City") %>'/>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtftrcity" runat="server"/>
<asp:RequiredFieldValidator ID="rfvcity" runat="server" ControlToValidate="txtftrcity" Text="*" ValidationGroup="validaiton"/>
</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Date">
<EditItemTemplate>
<asp:TextBox ID="txtInputDate" runat="server" Text='<%#Eval("InputDate") %>'/>
</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="lblInputDate" runat="server" Text='<%#Eval("InputDate") %>'/>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtftrInputDate" runat="server"/>
<asp:RequiredFieldValidator ID="rfvInputDate" runat="server" ControlToValidate="txtftrInputDate" Text="*" ValidationGroup="validaiton"/>
</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Minimum Temperature (°C)">
<EditItemTemplate>
<asp:TextBox ID="txtMinTemperature" runat="server" Text='<%#Eval("MinTemperature") %>'/>
</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="lblMinTemperature" runat="server" Text='<%#Eval("MinTemperature") %>'/>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtftrMinTemperature" runat="server"/>
<asp:RequiredFieldValidator ID="rfvMinTemperature" runat="server" ControlToValidate="txtftrMinTemperature" Text="*" ValidationGroup="validaiton"/>
</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Maximum Temperature (°C)">
<EditItemTemplate>
<asp:TextBox ID="txtMaxTemperature" runat="server" Text='<%#Eval("MaxTemperature") %>'/>
</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="lblMaxTemperature" runat="server" Text='<%#Eval("MaxTemperature") %>'/>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtftrMaxTemperature" runat="server"/>
<asp:RequiredFieldValidator ID="rfvMaxTemperature" runat="server" ControlToValidate="txtftrMaxTemperature" Text="*" ValidationGroup="validaiton"/>
</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Precipitation (mm)">
<EditItemTemplate>
<asp:TextBox ID="txtPrecipitation" runat="server" Text='<%#Eval("Precipitation") %>'/>
</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="lblPrecipitation" runat="server" Text='<%#Eval("Precipitation") %>'/>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtftrPrecipitation" runat="server"/>
<asp:RequiredFieldValidator ID="rfvPrecipitation" runat="server" ControlToValidate="txtftrPrecipitation" Text="*" ValidationGroup="validaiton"/>
</FooterTemplate>
</asp:TemplateField>
    <asp:TemplateField HeaderText="Humidity (%)">
<EditItemTemplate>
<asp:TextBox ID="txtHumidity" runat="server" Text='<%#Eval("Humidity") %>'/>
</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="lblHumidity" runat="server" Text='<%#Eval("Humidity") %>'/>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtftrHumidity" runat="server"/>
<asp:RequiredFieldValidator ID="rfvHumidity" runat="server" ControlToValidate="txtftrHumidity" Text="*" ValidationGroup="validaiton"/>
</FooterTemplate>
</asp:TemplateField>
    <asp:TemplateField HeaderText="WindSpeed (km/h)">
<EditItemTemplate>
<asp:TextBox ID="txtWindSpeed" runat="server" Text='<%#Eval("WindSpeed") %>'/>
</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="lblWindSpeed" runat="server" Text='<%#Eval("WindSpeed") %>'/>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtftrWindSpeed" runat="server"/>
<asp:RequiredFieldValidator ID="rfvWindSpeed" runat="server" ControlToValidate="txtftrWindSpeed" Text="*" ValidationGroup="validaiton"/>
</FooterTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
</div>
<div>
<asp:Label ID="lblresult" runat="server"></asp:Label>
</div>
 </form>
    <div class="auto-style4">
    </div>
</body>
</html>
