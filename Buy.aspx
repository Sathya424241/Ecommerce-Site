<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Buy.aspx.cs" Inherits="Buy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="w3-row-padding">
  <div class="w3-container w3-third">
    <img src="Images/is%20(5).jpg" alt="snow" style="width:30%;cursor:pointer" 
    onclick="onClick(this)" class="w3-hover-opacity"/>
  </div>
  <div class="w3-container w3-third">
    <img src="Images/images%20(1).jpg"  alt="snow" style="width:30%;cursor:pointer" 
    onclick="onClick(this)" class="w3-hover-opacity"/>
  </div>
  <div class="w3-container w3-third">
   <img src="Images/photo.jpg" alt="snow" style="width:30%;cursor:pointer" 
    onclick="onClick(this)" class="w3-hover-opacity"/>
  </div>
</div>

<div id="modal01" class="w3-modal" onclick="this.style.display='none'">
  <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
  <div class="w3-modal-content w3-animate-zoom">
    <img id="img01"  alt="snow"style="width:100%"/>
  </div>
</div>

<script>
    function onClick(element) {
        document.getElementById("img01").src = element.src;
        document.getElementById("modal01").style.display = "block";
        var image_url = document.getElementById("img01").src;
        var url = "Page2.htm?name=" + image_url + "&technology=" + encodeURIComponent(tech);
        window.location.href = url;
    }
</script>
          
    
    </div>
    </form>
</body>
</html>--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style>
    body
        {
            background-image: url('Images/buy2.jpg');
             background-size: 100%;
          
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Size="Larger" Font-Underline="True" ForeColor="White" 
            NavigateUrl="~/login.aspx">SignOut</asp:HyperLink>
    </p>
<script>
    function func() {
        var SchoolId = 1;
        window.location.href = "UploadedProduct_details.aspx?id=" + SchoolId;
    }
</script>
    <div>
        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRowDataBound" ForeColor="#333333"
            AutoGenerateColumns="false" >
            <Columns>
            <asp:TemplateField>
            <ItemTemplate>
            <%--<asp:CheckBox  ID="chk" runat="server" oncheckedchange="chk_checkedchange">
                </asp:CheckBox>--%>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="chk_checkedchange">Select</asp:LinkButton>
            </ItemTemplate>
                
            </asp:TemplateField>
                <asp:BoundField DataField="P_Model_Name" HeaderText="Product Name" />
                <asp:BoundField DataField="P_Description" HeaderText="Product Description" />
                <asp:BoundField DataField="P_Price" HeaderText="Product Price" />
                <asp:TemplateField HeaderText="Image" HeaderStyle-Width="200px">
                    <ItemTemplate>
                        <%--<a  onclick="func();" >
                            
                        </a>--%>

                        <asp:Image ID="Image1" runat="server" Height="80px" Width="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:GridView>
        <br />
        <br />
    </div>
    
    
    </form>
</body>
</html>
