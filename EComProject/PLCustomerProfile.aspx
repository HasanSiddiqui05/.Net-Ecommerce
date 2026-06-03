<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLCustomerProfile.aspx.cs" Inherits="EComProject.PLCustomerProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuickCart | Home Page</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/PLCP.css">
 <script type="text/javascript">
    function redirectToCart() {
        window.location.href = 'PLCart1.aspx'; 
    }
 </script>
</head>
<body>
    <form id="form1" runat="server">
            <header>
    <nav class="contain">

        <div class="logo">
            <img src="/Images/quickcartlogo-cropped.png" alt="" srcset="">
        </div>

        <div class="nav-links">
            <ul>
                <div class="dropdown-menu">
                    <a href=""><li>Categories &#x2193;</li></a>
                    <div class="dropdown-content">
                      <div class="dropdown-row">
                        <a href="PLElec.aspx"><li>Electronics</li></a>
                        <a href="PLFurni.aspx"><li>Furniture</li></a>
                      </div>
                      <div class="dropdown-row">
                        <a href="PLCloth.aspx"><li>Clothing</li></a>
                        <a href="PLShoes.aspx"><li>Shoes</li></a>
                      </div>
                      <div class="dropdown-row">
                        <a href="PLToys.aspx"><li>Toys</li></a>
                        <a href="PLBooks.aspx"><li>Books</li></a>
                      </div>
                    </div>
                </div>
                
                <a href=""><li>Deals</li></a>
                <a href=""><li>Whats New</li></a>
                <a href=""><li>Delivery</li></a>
            </ul>
        </div>
        <div class="search-bar">
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Search..."></asp:TextBox>
            <button class="search-bar-btn"><img src="/Images/icons8-search-24.png" alt="" srcset=""></button>
        </div>
        <div class="left-links">

            <div class="account-link">
            <img src="/Images/icons8-account-24.png" alt=""> Account
        </div>
        
        <div class="cart-link" id="cartLink" onclick="redirectToCart()">
            <img src="/Images/icons8-cart-24.png" alt="">Cart
        </div>
    </div>
    </nav>
</header>

        <div class="main-content">
    <div class="header">
        <div class="heading">
            <img src="/Images/icons8-account-24.png" alt=""> Profile Details
        </div>
    </div>
    <div class="main-body">
        <div class="section-1">
            <div class="col-heading">
                Store Information
            </div>
            <div class="input-row">
                <label for="">Name</label>
                <asp:TextBox ID="TextBox2" runat="server" type="text" name="sname"></asp:TextBox>
            </div>
            <div class="input-row">
                <label for="">Phone No</label>
                
                <asp:TextBox ID="TextBox3" runat="server" type="number" name="sdesc"></asp:TextBox>
            </div>
        </div>
        <div class="section-2">
            <div class="col-heading">
                Personal Information
            </div>
            <div class="row-content">
                <div class="input-row">
                    <label for="">Email</label>
                <asp:TextBox ID="TextBox4" runat="server"  type="text" name="phoneno"></asp:TextBox>
                </div>
                <div class="input-row">
                    <label for="">Address</label>
                <asp:TextBox ID="TextBox5" runat="server" type="text" name="address"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div class="section-3">
        <div class="btn-row">
            <button class="edit-btn" runat="server" ><img src="/Images/icons8-edit-24.png" alt="" onserverclick="">Edit</button>
            <button class="save-btn" id="button2" runat="server" ><img src="/Images/icons8-save-24-white.png" alt="" onserverclick="Button2_Click">Save</button>
            <br />
            <br />
        </div>
    </div>
</div>

<%--<div class="main-body">
    <table >
        <thead>
            <tr border="1">
                <td>
                    Order ID
                </td>
                <td>
                    Customer Name
                </td>
                <td rowspan="2">
                    Delivery Address
                </td>
                <td>
                    Contact 
                </td>
                <td>
                    Total
                </td>
                <td>
                    Payment Method
                </td>
                <td>
                    Date
                </td>
                <td>
                    Actions
                </td>
            </tr>
        </thead>
                      
     <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" >
    <ItemTemplate>
    <tbody>
        <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("orderid") %>' />
                </td>

                <td>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("name") %>' />
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("u_address") %>' />
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("phoneno") %>' />
                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("total_bill") %>' />
                </td>
                <td>Cash On Delivery</td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# String.Format("{0:MM/dd/yyyy}", Eval("order_date")) %>'  />
                </td>
                <td>

                </td>
                <td>
                    <a href="#" class="decline-btn" onclick="setOrderId('<%# Eval("orderid") %>', 'decline')">
                        <img src="/Images/icons8-cross-24.png" alt="">
                    </a>
                </td>
            </tr>
        </tbody>
    </ItemTemplate>
    </asp:ListView>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" SelectCommand="select orderid, name, u_address, phoneno, total_bill, order_date from orders o join users u on o.order_user_id = u.userid join order_details od on o.orderid = od.details_orderid where details_status like 'Order ready to dispatch from store'"></asp:SqlDataSource>
        <div />--%>

    </form>
</body>
</html>
