<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLSellerProfile.aspx.cs" Inherits="EComProject.PLSellerProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller | Profile</title>
    <link rel="stylesheet" href="/css/PLSellerProfile.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
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
                <a href="PLViewInventory.aspx">
                    <li>
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
                <a href="">
                    <li class="active"><img src="/Images/icons8-account-24.png" alt=""><span class="hide">Profile</span></li>
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
                <img src="/Images/icons8-account-24.png" alt=""> Profile Details
            </div>
        </div>
        <div class="main-body">
            <div class="section-1">
                <div class="col-heading">
                    Store Information
                </div>
                <div class="input-row">
                    <label for="">Store Name</label>
                    <%--<input runat="server" type="text" name="sname" id="textbox1" disabled>--%>
                    <asp:TextBox ID="TextBox1" runat="server" type="text" name="sname"></asp:TextBox>
                </div>
                <div class="input-row">
                    <label for="">Store Description</label>
                    <%--<textarea runat="server" name="sdesc" id="textbox2" rows="8" disabled></textarea>--%>
                    
                    <asp:TextBox ID="TextBox2" runat="server" type="text" name="sdesc"></asp:TextBox>
                </div>
            </div>
            <div class="section-2">
                <div class="col-heading">
                    Personal Information
                </div>
                <div class="row-content">
                    <div class="input-row">
                        <label for="">Contact</label>
                        <%--<input runat="server" type="number" name="phoneno" id="textbox3" disabled>--%>
                    <asp:TextBox ID="TextBox3" runat="server" type="number" name="phoneno"></asp:TextBox>
                    </div>
                    <div class="input-row">
                        <label for="">Address</label>
                        <%--<input runat="server" type="text" name="address" id="textbox4" disabled>--%>
                    <asp:TextBox ID="TextBox4" runat="server" type="text" name="address"></asp:TextBox>
                    </div>
                    <div class="input-row">
                        <label for="">Email</label>
                        <%--<input runat="server" type="email" name="email" id="textbox5" disabled>--%>
                    <asp:TextBox ID="TextBox5" runat="server" name="email"></asp:TextBox>
                    </div>
                </div>
            </div>
           
        </div>
        <div class="section-3">
            <div class="btn-row">
                <button class="edit-btn" runat="server" onserverclick = "Button1_Click"><img src="/Images/icons8-edit-24.png" alt="">Edit</button>
                <button class="save-btn" id="button2" runat="server" onserverclick = "Button2_Click"><img src="/Images/icons8-save-24-white.png" alt="">Save</button>
                <br />
                <br />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
