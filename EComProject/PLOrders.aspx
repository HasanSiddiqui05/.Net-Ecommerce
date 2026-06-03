<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLOrders.aspx.cs" Inherits="EComProject.PLOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Seller | Orders</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="/css/PLOrder.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <nav>
        <div class="logo">
            <img src="/Images/quickcart_logo.png" alt="">
        </div>
        <div class="sub-title">
            Main Menu
        </div>
        <div class="side-links">
            <ul>
                <a href="PLAddProduct.aspx">
                    <li><img src="/Images/icons8-product-24.png" alt=""><span class="hide">Add Products</span></li>
                </a>
                <a href="PLUI.aspx">
                    <li><img src="/Images/icons8-product-management-24.png" alt=""> <span class="hide">Update Inventory</span></li>
                </a>
                <a href="PLViewInventory.aspx">
                    <li>
                        <img src="/Images/icons8-warehouse-24.png" alt=""><span class="hide">View Inventory</span>
                    </li>
                </a>
                <a href="PLOrders.aspx">
                    <li class="active">
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
                <img src="/Images/icons8-product-management-24.png" alt=""> View Inventory
            </div>
        </div>
        <div class="main-body">
           <table >
    <thead>
        <tr border="1">
             <td>
                 Order ID
             </td>
            <td>
                Product ID
            </td>
            <td>
                Product Name
            </td>
            <td >
                Ordered Quantity
            </td>
            <td>
                Price
            </td>
            <td rowspan="2">
                Ordered Date
            </td>
            <td>
                Status
            </td>
            <td>
                Update Status
            </td>
        </tr>
    </thead>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
        <tbody>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("orderid") %>' />
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("details_productid") %>' />
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>' />
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("details_cquantity") %>' />
                </td>
               <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("details_price") %>' />
                </td>
                 <td>
                     <asp:Label ID="Label5" runat="server" Text='<%# String.Format("{0:MM/dd/yyyy}", Eval("order_date")) %>' />
                 </td>
                 <td>
                     <asp:Label ID="Label6" runat="server" Text='<%# Eval("details_status") %>' />
                 </td>
                 <td>
                     <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" >
                         <asp:ListItem>Order Placed by Customer</asp:ListItem>
                         <asp:ListItem>Order Ready to dispatch from store</asp:ListItem>
                     </asp:DropDownList>
                </td>
            </tr>
        </tbody>
    </ItemTemplate>
        </asp:ListView>
            </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" SelectCommand="select orderid, details_productid, ProductName, details_cquantity, details_price, order_date, details_status from order_details od join products p on od.details_productid = p.productid join store s on p.store_id = s.storeid join orders o on od.details_orderid = o.orderid where storeid = @sid and details_status like 'Order Placed by Customer'">
            <SelectParameters>
                <asp:ControlParameter Name="sid" ControlID="TextBox1"/>
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
    </div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </form>
</body>
</html>

