<%@ Page Language="C#" AutoEventWireup="true" CodeFile="placeorder.aspx.cs" Inherits="placeorder" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style>
    body
        {
            background-image: url('Images/viewproddetails.jpg');
             background-size: 100%;
          
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server"  CellPadding="4" OnRowDataBound="OnRowDataBound"
            ForeColor="#333333" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="P_Model_Name" HeaderText="Product Name" />
                <asp:BoundField DataField="P_Description" HeaderText="Product Description" />
                <asp:BoundField DataField="P_Price" HeaderText="Product Price" />
                <asp:TemplateField HeaderText="Image" HeaderStyle-Width="200px">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:GridView>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="--Once Order is placed cannot be canncelled--"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Order Now" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Want to Purchase Again ?"></asp:Label>
&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Buy.aspx">Clickhere</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/login.aspx">SignOut</asp:HyperLink>
        <br />
        
        <%--<asp:Button ID="Button1" runat="server" Text="Order Now" OnClick="Button2_Click" />--%>
    </div>
    </form>
</body>
</html>

