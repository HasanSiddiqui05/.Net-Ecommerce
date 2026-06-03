<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLUI.aspx.cs" Inherits="EComProject.PLUI" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Seller | Update Inventory</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="/css/PLUI.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
        function showModal() {
            $('#exampleModalLong').modal('show');
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <nav>
                <div class="logo">
                    <img src="/Images/quickcart_logo.png" alt="" />
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
                <img src="/Images/icons8-product-management-24.png" alt=""> Update Inventory
                <asp:Label ID="Label7" runat="server"></asp:Label>
            </div>
        </div>

            <div class="main-body">
                <div class="input-fields">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </div>

                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                    ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True"
                    UpdateCommand="UPDATE products SET ProductName = @ProductName, Description = @Description, Category = @Category, Quantity = @Quantity, Price = @Price WHERE productid = @productid">
                    <UpdateParameters>
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Category" Type="String" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="productid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>


                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" 
                    DeleteCommand="DELETE FROM products WHERE productid = @productid">
                    <DeleteParameters>
                        <asp:Parameter Name="productid" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" 
                    SelectCommand="SELECT productid, ProductName, Description, Category, Quantity, Price FROM products WHERE store_id = @store_id">
                    <SelectParameters>
                        <asp:ControlParameter Name="store_id" ControlID="TextBox6" PropertyName="Text"/>
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" BorderStyle="None">
                    <Columns>
                        <asp:BoundField DataField="productid" HeaderText="Product ID" />
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                        <asp:BoundField DataField="Description" HeaderText="Product Description" />
                        <asp:BoundField DataField="Category" HeaderText="Category" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnInsert" runat="server" ImageUrl="/Images/icons8-edit-24.png" CommandName="InsertData" CommandArgument='<%# Container.DataItemIndex %>' />
                                <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="/Images/icons8-trash-24.png" CommandName="DeleteData" CommandArgument='<%# Container.DataItemIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
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
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-row">
                            <label for="">Product description</label>
                            <asp:TextBox ID="TextBox2" runat="server" Height="65px"></asp:TextBox>
                        </div>
                        <div class="input-row">
                            <label for="">Stock</label>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-row">
                            <label for="">Price</label>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
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
                        <button type="button" class="btn save-btn" runat="server" onserverclick="SaveChanges_Click">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
