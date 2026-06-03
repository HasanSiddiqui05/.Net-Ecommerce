<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLLogin.aspx.cs" Inherits="EComProject.PLLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/PLLogin.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <title>Sign In | E-Commerce</title>
</head>
<body>
    <form id="form1" runat="server">
        
   <div class="section-1">
        <div class="title">Sign In</div>
        <form action="">
            <div class="details">
                <div class="div-input flex">
                <Label>Email</Label>
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Your Email" required></asp:TextBox>
                    </div>
            <div class="div-input flex">
                <Label>Password</Label>
                <asp:TextBox type="Password" ID="TextBox2" runat="server" placeholder="Enter Your Password" required></asp:TextBox>
            </div>
            <div class="div-dropdown">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="31px" Width="138px" style="text-align: center">
                <asp:ListItem>Select Type</asp:ListItem>
                <asp:ListItem>Customer</asp:ListItem>
                <asp:ListItem>Seller</asp:ListItem>
                <asp:ListItem>Delivery</asp:ListItem>
                </asp:DropDownList>
            </div>

            <%--<br />
            <div class="g-recaptcha" data-sitekey="6LfUhfQpAAAAAJiMdnPgy2iAb8JYuZXxPAzI326x"></div>
            <br />--%>

            <asp:Button ID="Button1" class="signin-btn" runat="server" OnClick="Button1_Click1" Text="Login" />
        </div>
            <br />
            <p>Don't have an account? <a href="PLRegistration.aspx">create one</a></p>
    </form>
    </div>
    <div class="section-2">
        <div class="overlay">
            <h2>Best Deals, Best Prices, Fast Delivery</h2>
            <h4>Electronics, Accessories, and much more!</h4>
        </div>
    </div>

    </form>
</body>
</html>
