<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserRegister.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">  
    <title></title>
    <style>
    body
        {
            background-image: url('Images/register.jpg');
             background-size: 100%;
          
        }
    </style>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.check').on('change', function () {
                $('.check').not(this).prop('checked', false);
            });
        });
    </script>
    <form id="form1" runat="server">
    <div>
        <br />
        <h1> USER  REGISTRATION</h1>
    <br />
    <br />
    &nbsp;
    <asp:Label ID="Label1" runat="server" Text="UserName :" Font-Size="Larger"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    <asp:TextBox ID="Username" runat="server" Style="text-align: center" 
            BorderColor="Black" Font-Size="Larger"></asp:TextBox>
    <br />
    <br />
    &nbsp;
    <asp:Label ID="Label2" runat="server" Text="UserMail-ID :" Font-Size="Larger"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="UserMaild_id" runat="server" BorderColor="Black" 
            Font-Size="Larger"></asp:TextBox>
    <br />
    <br />
    &nbsp;
    <asp:Label ID="Label3" runat="server" Text="Password :" Font-Size="Larger"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    <asp:TextBox ID="Passowrd" runat="server" BorderColor="Black" Font-Size="Larger"></asp:TextBox>
    <br />
    <br />
    &nbsp;
    <asp:Label ID="Label4" runat="server" Text="Gender :" Font-Size="Larger"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButtonList ID="Gender" 
        runat="server" Style="margin-left: 210px" 
        Width="134px" Font-Size="Larger">
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>FeMale</asp:ListItem>
        <asp:ListItem>Others</asp:ListItem>
    </asp:RadioButtonList>
    &nbsp;&nbsp;
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="Country :" 
            AsyncPostBackTriggerControlID="CountryList" Font-Size="Larger"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <asp:DropDownList ID="CountryList" runat="server" 
         AutoPostBack="true" 
        onselectedindexchanged="CountryList_SelectedIndexChanged" Font-Size="Larger" 
            style="margin-left: 0px">
    </asp:DropDownList>
    <%--<asp:CheckBoxList ID="CheckBoxList1" runat="server" CssClass='check' style="margin-left: 155px" 
        Width="163px">
        <asp:ListItem>INDIA</asp:ListItem>
        <asp:ListItem>USA</asp:ListItem>
    </asp:CheckBoxList>--%>
    <br />
    <br />
    &nbsp;
    <asp:Label ID="Label6" runat="server" Text="State :" 
            AsyncPostBackTriggerControlID="StateList" Font-Size="Larger" ></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <asp:DropDownList ID="StateList" runat="server" AutoPostBack="true" 
        onselectedindexchanged="StateList_SelectedIndexChanged" Font-Size="Larger">
    </asp:DropDownList>
    <br />
    <br />
    &nbsp;
    <asp:Label ID="Label7" runat="server" Text="City :" 
            AsyncPostBackTriggerControlID ="CityList" Font-Size="Larger"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList ID="CityList" runat="server" Font-Size="Larger" >
    </asp:DropDownList>
    <br />
    <br />
    &nbsp;
    <asp:Label ID="Label8" runat="server" Text="Phone :" Font-Size="Larger"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="PhoneNo" runat="server" BorderColor="Black" Font-Size="Larger"></asp:TextBox>
    <br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <%--<asp:Label ID="Label9" runat="server" Text="Buy or Sell  Products"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:CheckBox ID="CheckBox1" runat="server" class="checkbox" Text="Buy" />
&nbsp;&nbsp;
    <asp:CheckBox ID="CheckBox2" runat="server" class="checkbox" Text="Sell" />--%>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button2_Click" Text="Register" 
        Height="38px" style="margin-left: 43px" Width="164px" BorderStyle="Groove" 
            Font-Size="Larger" />
    <br />
    <br />
    <br />
    <br />
    </div>
    </form>
</body>
</html>

