<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLViewInventory.aspx.cs" Inherits="EComProject.PLViewInventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller | View Inventory</title>
    <link rel="stylesheet" href="/css/PLVI.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
        rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <nav>
        <div class="logo">
            <img src="/Images/quickcart_logo.png" alt="" >
        </div>
        <div class="sub-title">
            Main Menu
        </div>
        <div class="side-links">
            <ul>
                <a href="PLAddProduct.aspx">
                    <li ><img src="/Images/icons8-product-24.png" alt=""><span class="hide">Add Products</span></li>
                </a>
                <a href="PLUI.aspx">
                    <li><img src="/Images/icons8-product-management-24.png" alt=""> <span class="hide">Update Inventory</span></li>
                </a>
                <a href="">
                    <li class="active">
                        <img src="/Images/icons8-warehouse-24.png" alt=""><span class="hide">View Inventory</span>
                    </li>
                </a>
                <a href="PLOrders.aspx">
                    <li>
                        <img src="/Images/icons8-order-history-24.png" alt=""><span class="hide">Orders</span>
                    </li>
                </a>
            </ul>
        </div>
        <div class="sub-title space">
            General
        </div>
        <div class="side-links">
            <ul>
                <a href="PLSellerProfile.aspx">
                    <li><img src="/Images/icons8-account-24.png" alt=""><span class="hide">Profile</span></li>
                </a>
                <a href="PLLogin.aspx">
                    <li><img src="/Images/icons8-sign-out-24.png" alt=""><span class="hide">Sign Out</span></li>
                </a>
            </ul>
        </div>
    </nav>
    <div class="main-content">
        <div class="header">
            <div class="heading">
                <img src="/Images/icons8-product-24.png" alt=""> View Inventory
            </div>
            </div>

            <asp:ListView ID="ListView1" runat="server" DataKeyNames="productid" DataSourceID="SqlDataSource1">
        <ItemTemplate>
        <div class="product-card">
            <div class="product-img">
                <asp:Image ID="image1" runat="server" ImageUrl='<%# Eval("imagepath") %>' />
            </div>
            <div class="product-content">
                <div class="product-name">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>' />
                </div>
                <div class="product-desc">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>' />
                </div>
                <div class="product-info">
                    <div class="price"><asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>' /> PKR</div>
                    <div class="stock"><asp:Label ID="Label4" runat="server" Text='<%# Eval("Quantity") %>' /> in stock</div>
                </div>
            </div>
        </div>
    </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" SelectCommand="SELECT[productid], [ProductName], [Category], [Description], [Price], [Quantity], [imagepath] FROM[products] WHERE ([store_id])=(@store_id)">
        <SelectParameters>
            <asp:ControlParameter Name="store_id" ControlID="TextBox1"/>
        </SelectParameters>
    </asp:SqlDataSource>
         
            </div>
        </div>
    
    
        <p>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
    
    
    </form>
    </body>
</html>
