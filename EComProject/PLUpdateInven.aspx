<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLUpdateInven.aspx.cs" Inherits="EComProject.checking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Seller | Update Inventory</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="/css/PLUI.css" />
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
                <a href="">
                    <li class="active"><img src="/Images/icons8-product-management-24.png" alt=""> <span class="hide">Update Inventory</span></li>
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
                Product ID
            </td>
            <td>
                Product Name
            </td>
            <td rowspan="2">
                Product Description
            </td>
            <td>
                Category
            </td>
            <td>
                Stock
            </td>
            <td>
                Price
            </td>
            <td>
                Actions
            </td>
        </tr>
    </thead>
<asp:ListView ID="ListView1" runat="server" DataKeyNames="productid" DataSourceID="SqlDataSource1" >
    <ItemTemplate>
    <tbody>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("productid") %>' />
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>' />
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Description") %>' />
            </td>
           <td>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Category") %>' />
            </td>
             <td>
                 <asp:Label ID="Label5" runat="server" Text='<%# Eval("Quantity") %>' />
             </td>
             <td>
                 <asp:Label ID="Label6" runat="server" Text='<%# Eval("Price") %>' />
             </td>
             <td>
                <img src="/Images/icons8-create-24.png" class="edit-btn" alt=""  CommandName="ViewProduct" CommandArgument='<%# Eval("productid") %>' data-toggle="modal" data-target="#exampleModalLong" runat="server">
                <img src="/Images/icons8-trash-24.png"class="delete-btn" alt="">
            </td>
        </tr>
    </tbody>
    </ItemTemplate>
        </asp:ListView>
            </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" SelectCommand="SELECT productid, ProductName, Description, Category, Quantity, Price FROM products WHERE store_id = @store_id">
            <SelectParameters>
                <asp:ControlParameter Name="store_id" ControlID="TextBox1"/>
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
    </div>


    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">Edit Product Details</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <div class="input-row">
                    <label for="">Product Name</label>
                    <asp:TextBox ID="TextBox2" type="text" runat="server" required></asp:TextBox>
                </div>
                <div class="input-row">
                    <label for="">Product description</label>
                    <asp:TextBox ID="TextBox10" type="text" runat="server" Height="65px" required></asp:TextBox>

                    </textarea>
                </div>
                <div class="input-row">
                    <label for="">Stock</label>
                    <asp:TextBox ID="TextBox3" type="number" runat="server" required></asp:TextBox>
                </div>
                <div class="input-row">
                    <label for="">Price</label>
                    <asp:TextBox ID="TextBox4" type="number" runat="server" required></asp:TextBox>
                    <asp:TextBox ID="TextBox9" type="number" runat="server" required></asp:TextBox>
                </div>
              
                <div class="input-row">
                    <label for="">Category</label>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Books</asp:ListItem>
                        <asp:ListItem>Clothing</asp:ListItem>
                        <asp:ListItem>Electronics</asp:ListItem>
                        <asp:ListItem>Furniture</asp:ListItem>
                        <asp:ListItem>Shoes</asp:ListItem>
                        <asp:ListItem>Toys</asp:ListItem>
                    </asp:DropDownList>        
                </div>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn close-btn" data-dismiss="modal">Close</button>
              <button type="button" class="btn save-btn">Save changes</button>
            </div>
          </div>
        </div>
      </div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    </form>
</body>
</html>
