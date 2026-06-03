<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLPExpand.aspx.cs" Inherits="EComProject.PLPExpand" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuickCart | Product Page</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/PLProductPage.css">
     <script type="text/javascript">
        function redirectToCart() {
            window.location.href = 'PLCart1.aspx'; // Change this to your target URL
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
            <div class="wrapper">
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="productid" DataSourceID="SqlDataSource1" >
            <ItemTemplate>
        <div class="image-section">
                <asp:Image ID="image2" runat="server" ImageUrl='<%# Eval("imagepath") %>' />
        </div>
        <div class="product-details">
            <h1><asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>' /></h1>
            <div class="product-desc">
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Description") %>' />
            </div>
            <div class="product-price">
                <div class="price"><asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>' /> PKR</div>
            </div>
            <div class="addtocart-btn">
                <button runat="server" onserverclick="button1_click">Add to Cart</button>
            </div>
        </div>
                
        <asp:HiddenField ID="HiddenProductId" runat="server" Value='<%# Eval("productid") %>' />
    </ItemTemplate>
</asp:ListView>
        </div>
            
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" SelectCommand="SELECT[productid], [ProductName], [Category], [Description], [Price], [Quantity], [imagepath] FROM[products] WHERE [productid] = @Pid "> 
     <SelectParameters>
     <asp:ControlParameter Name="Pid" ControlID="TextBox1"/>
 </SelectParameters>
</asp:SqlDataSource>

             
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" SelectCommand="select name, review from reviews r join users u on u.userid = r.review_userid where review_productid = @pid"> 
             <SelectParameters>
             <asp:ControlParameter Name="pid" ControlID="TextBox1"/>
         </SelectParameters>
        </asp:SqlDataSource>

    
    <h2 class="section-title">Reviews</h2>
    <div class="view-reviews">
        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" >
         <ItemTemplate>
        <div class="review-card">
            <div class="rating">
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span>
            </div>
            <div class="review-desc">
               "<asp:Label ID="Label4" runat="server" Text='<%# Eval("review") %>' />"
            </div>
            <div class="reviewer-name">
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>' />
            </div>
        </div>
        </ItemTemplate>
        </asp:ListView>

        </section>

        <section class="contain add-review">
            <h2 class="section-title">Add a Review</h2>
            <div class="add-review-section">
                <div class="rate">
                <input type="radio" id="star5" name="rate" value="5" />
                <label for="star5" title="text">5 stars</label>
            <input type="radio" id="star4" name="rate" value="4" />
        <label for="star4" title="text">4 stars</label>
                <input type="radio" id="star3" name="rate" value="3" />
            <label for="star3" title="text">3 stars</label>
                <input type="radio" id="star2" name="rate" value="2" />
            <label for="star2" title="text">2 stars</label>
        <input type="radio" id="star1" name="rate" value="1" />
    <label for="star1" title="text">1 star</label>
</div>
<div class="review-input">
    <textarea id="TextArea1" cols="60" rows="8" runat="server"></textarea>
</div>
<div class="submit-review">
    <asp:Button ID="Button1" runat="server" Text="Submit Review" Height="" OnClick="insert_review" class="submit-btn" />
</div>
</div>

</section>
      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </form>
</body>
</html>
