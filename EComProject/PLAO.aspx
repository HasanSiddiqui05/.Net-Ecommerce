<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLAO.aspx.cs" Inherits="EComProject.PLAO" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery | Incoming Orders</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/PLAO.css">

    <script>
        function redirectToMap(address) {
            window.location.href = 'PLMap.aspx?u_address=' + encodeURIComponent(address);
        }
    </script>
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
                    <a href="PLIO.aspx">
                        <li><img src="/Images/icons8-product-24.png" alt=""><span class="hide">Incoming Orders</span></li>
                    </a>
                    <a href="">
                        <li class="active"><img src="/Images/icons8-product-management-24.png" alt=""><span class="hide">Accepted Orders</span></li>
                    </a>
                </ul>
            </div>
            <div class="sub-title space">
                General
            </div>
            <div class="side-links">
                <ul>
                    <a href="">
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
                    <img src="/Images/icons8-product-management-24.png" alt=""> Accepted Orders
                </div>
            </div>
            <div class="main-body">
                <table>
                    <thead>
                        <tr border="1">
                            <td>Order ID</td>
                            <td>Customer Name</td>
                            <td rowspan="2">Delivery Address</td>
                            <td>Contact</td>
                            <td>Total</td>
                            <td>Payment Method</td>
                            <td>Status</td>
                            <td>Actions</td>
                        </tr>
                    </thead>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("orderid") %>' /></td>
                                    <td><asp:Label ID="Label7" runat="server" Text='<%# Eval("name") %>' /></td>
                                    <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("u_address") %>' /></td>
                                    <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("phoneno") %>' /></td>
                                    <td><asp:Label ID="Label8" runat="server" Text='<%# Eval("total_bill") %>' /></td>
                                    <td>Cash On Delivery</td>
                                    <td class="status-col">
                                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                            <asp:ListItem>Order Pending to be delivered</asp:ListItem>
                                            <asp:ListItem>Order Delivered</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <button class="address-btn" type="button" onclick='redirectToMap("<%# Eval("u_address") %>")'>
                                            <img src="/Images/icons8-map-24.png" alt="">
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </ItemTemplate>
                    </asp:ListView>
                </table>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" SelectCommand="select orderid, name, u_address, phoneno, total_bill from orders o join users u on o.order_user_id = u.userid join order_details od on o.orderid = od.details_orderid where rider_id = @rid and details_status like 'Order accepted by Rider'">
                    <SelectParameters>
                        <asp:ControlParameter Name="rid" ControlID="TextBox1" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </form>
</body>
</html>
