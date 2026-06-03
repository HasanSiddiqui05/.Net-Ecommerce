<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLCart1.aspx.cs" Inherits="EComProject.PLCart1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuickCart | Cart</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/PLC1.css">
</head>
    <script>
        function redirectToHome() {
            window.location.href = 'PLHome.aspx';
        }
    </script>
<body>
    <form id="form1" runat="server">
       <header>
        <nav class="contain">

            <div class="logo" onclick="redirectToHome()">
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
                <input type="text" name="" id="" placeholder="Search...">
                <button><img src="/Images/icons8-search-24.png" alt="" srcset=""></button>
            </div>
            <div class="left-links">

                <div class="account-link">
                <img src="/Images/icons8-account-24.png" alt=""> Account
            </div>
            
            <div class="cart-link">
                <img src="/Images/icons8-cart-24.png" alt="">Cart
            </div>
        </div>
        </nav>
    </header>


    <section class="contain">
        <div class="page-title"><img src="/Images/icons8-cart-24.png" alt="" srcset="">Cart</div>  <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
        <div class="timeline">
            <div class="bubble">1</div>
            <div class="bar inactive"></div>
            <div class="bubble inactive">2</div>
            <div class="bar inactive"></div>
            <div class="bubble inactive">3</div>
        </div>
        <div class="timeline-titles">
            <div class="title">Checkout</div>
            <div class="title ">Address</div>
            <div class="title">Payment</div>            
        </div>
        <div class="main-content">
            <div class="product-list">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
                    <ItemTemplate>

                        <div class="product-card">
                            <div class="product-img">
                                <asp:Image ID="image1" runat="server" ImageUrl='<%# Eval("imagepath") %>' />
                            </div>
                            <div class="product-info">
                                <div class="product-name">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>' />
                                </div>
                                <div class="product-description">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Description") %>' />
                                </div>
                                <div class="product-price">
                                     <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>' />
                                </div>
                                <div class="action-btns">
                                    <div class="quantity-btn">
                                        <asp:Button ID="Sub_Button" runat="server" CommandName="Decrement" CommandArgument='<%# Container.DataItemIndex %>' Text="-" class="quantity-btns" />
                                        <asp:Label ID="Quantity" name="quantity" runat="server" Text="0" CssClass="quantity" ></asp:Label>
                                        <asp:Button ID="Add_Button" runat="server" CommandName="Increment" CommandArgument='<%# Container.DataItemIndex %>' Text="+" class="quantity-btns" />
                                    </div>
                                    <div class="remove-btn">
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="/Images/icons8-trash-24.png" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>' />
                                    </div>
                                </div>
                            </div>
                            <asp:HiddenField ID="HiddenProductId" runat="server" Value='<%# Eval("productid") %>' />
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" 
                    SelectCommand="select productid, ProductName, Description, Price, imagepath, cquantity from products p join items_in_cart i on p.productid = i.product_id join cart c on c.cartid = i.cart_id join users u on u.userid = c.cart_user_id where userid = @user_id"
                    DeleteCommand="DELETE FROM items_in_cart WHERE product_id = @product_id AND cart_id = @cart_id">
                    <SelectParameters>
                        <asp:ControlParameter Name="user_id" ControlID="TextBox1"/>
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="product_id" Type="String" />
                        <asp:Parameter Name="cart_id" Type="String" />
                    </DeleteParameters>
                </asp:SqlDataSource>

            </div>
            <div class="order-summary">
                <div class="summary">
                    Order Summary
                </div>
                <div class="summary-row">
                    <div class="summary-heading">Sub Total</div>
                    <div class="summary-total"><asp:Label ID="TLabel" runat="server" Text=""></asp:Label><asp:Label ID="Label4" runat="server" Text=" PKR"></asp:Label></div>
                </div>
                <div class="summary-row">
                    <div class="summary-heading">Tax</div>
                    <div class="summary-total"><asp:Label ID="Label6" runat="server" Text="0 PKR"></asp:Label></div>
                </div>
                <div class="summary-row">
                    <div class="summary-heading">Shipping</div>
                    <div class="summary-total"><asp:Label ID="Label7" runat="server" Text="1000 PKR"></asp:Label></div>
                </div>
                <div class="summary-row">
                    <div class="summary-heading">Total</div>
                    <div class="summary-total"><asp:Label ID="Total" runat="server" Text=""></asp:Label> <asp:Label ID="Label8" runat="server" Text=" PKR"></asp:Label></div>
                </div>
                <div class="proceed-btn">
                    <button id="cart1btns" runat="server" onserverclick="Cart1Redirect">
                        Proceed to Checkout 
                    </button>
                </div>
            </div>
        </div>
    </section>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </form>
</body>
</html>
