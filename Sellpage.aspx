<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sellpage.aspx.cs" Inherits="Default5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title></title>
    <style>
        label
        {
            margin: 0;
            display: block;
        }
        input[type="text"], textarea
        {
            padding: 2px;
            width: 300px;
            font-family: inherit;
        }
        textarea
        {
            height: 100px;
        }
        
        body
        {
            background-image: url('Images/proddetails.jpg');
            background-size: 100%;
        }
    </style>
</head>
<body>
    <h2>
        PRODUCT DETAILS</h2>
    
    <form method="post" runat="server" enctype="multipart/form-data">
    <div>
        <label id="name">
            Product Name</label><br />
        <asp:TextBox ID="P_Name" runat="server"></asp:TextBox>
        <%--<input type="text" name="name" id="P_Name" /><br />--%>
        <label id="price">
            Product Price</label><br />
        <asp:TextBox ID="P_Price" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
        <%--<input type="text" name="P_price" id="P_Price" /><br />--%>
        <label id="desc">
            Product Description</label><br />
        <textarea id="P_desc" name="P_desc" cols="20" rows="2"></textarea>
        <%-- <textarea name="P_desc" id="P_desc"></textarea><br />--%>
        <br />
        <label id="imgs">
            Product Image</label><br />
        <%--<input type="file" name="P_ImgURL" id="img" accept="C:/Users/New/Documents/Visual Studio 2010/WebSites/WebSite1/Images/*" /><br />--%>
        <asp:FileUpload ID="UploadImage" runat="server" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Customers will Contact you"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Black">View Uploaded Product Details</asp:HyperLink>
        <%--<input type="submit" value="Save" />--%>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
    </div>
    </form>
    <script type="text/javascript">
        var somefunction = function () {
            var hdnfldVariable = document.getElementById('hdnfldVariable');
            hdnfldVariable.value = hdnfldVariable;
        }

        function numeric(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && ((charCode >= 48 && charCode <= 57) || charCode == 46))
                return true;
            else {
                alert('Please Enter Numeric values.');
                return false;
            }
        }


    </script>
</body>
</html>
