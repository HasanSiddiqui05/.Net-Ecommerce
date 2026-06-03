<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLSearch.aspx.cs" Inherits="EComProject.PLSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuickCart | Home Page</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/css/PLCategory.css">
        
    <script type="text/javascript">
        function redirectToCart() {
            window.location.href = 'PLCart1.aspx';
        }
        function redirectToProduct(productId) {
            window.location.href = 'PLPExpand.aspx?productid=' + productId;
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
                <input type="text" name="" id="" placeholder="Search...">
                <button><img src="/Images/icons8-search-24.png" alt="" srcset=""></button>
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

<section class="contain main">

    <h2>Search Result</h2>
	<div class="filter">
        <img src="/Images/icons8-sort-24.png" alt="">

        <Select>
            <option value="">Sort By</option>
            <option value="">Price, High to Low</option>
            <option value="">Price, Low to High</option>
        </Select>
    </div>

        <div class="products-list">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="productid" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="product" >
                <div class="product-image" onclick='<%# "redirectToProduct(" + Eval("productid") + ")" %>'>
                    <asp:Image ID="image2" runat="server" ImageUrl='<%# Eval("imagepath") %>' />
                </div>
                <div class="product-row" onclick='<%# "redirectToProduct(" + Eval("productid") + ")" %>'>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>' />
                    <div class="price"><asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>' /> PKR</div>
                </div>
                <div class="product-desc" onclick='<%# "redirectToProduct(" + Eval("productid") + ")" %>'>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>' />
                </div>
            </div>
            <asp:HiddenField ID="HiddenProductId" runat="server" Value='<%# Eval("productid") %>' />
        </ItemTemplate>

    <EmptyDataTemplate>
        <div class="no-data">
            No search result found.
        </div>
    </EmptyDataTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" 
        SelectCommand="SELECT [productid], [ProductName], [Category], [Description], [Price], [Quantity], [imagepath] FROM [products] WHERE [ProductName] LIKE '%' + @pname + '%' AND Quantity > 0">
        <SelectParameters>
            <asp:ControlParameter Name="pname" ControlID="TextBox1"/>
        </SelectParameters>
    </asp:SqlDataSource>
</div>
</section>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </form>
</body>
</html>

