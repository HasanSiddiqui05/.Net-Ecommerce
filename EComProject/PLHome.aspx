<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLHome.aspx.cs" Inherits="EComProject.PLHome" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuickCart | Home Page</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/PLHom.css">
     <script type="text/javascript">
        function redirectToCart() {
            window.location.href = 'PLCart1.aspx'; 
         }
         function redirectToProfile() {
             window.location.href = 'PLCustomerProfile.aspx';
         }
         function redirectToLogin() {
             window.location.href = 'PLLogin.aspx';
         }
         function getProductNameAndRedirect() {
             var productName = document.getElementById('<%= TextBox1.ClientID %>').value;
             redirectToSearch(productName);
         }
         function redirectToSearch(productName) {
             window.location.href = 'PLSearch.aspx?productname=' + encodeURIComponent(productName);
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
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Search..."></asp:TextBox>
                <button type="button" onclick="getProductNameAndRedirect()">
                    <img src="/Images/icons8-search-24.png" alt="Search">
                </button>
                <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" TargetControlID="TextBox1" Enabled="true" EnableCaching="false" CompletionInterval="100" CompletionSetCount="2" MinimumPrefixLength="1" ServiceMethod="GetItemName"  runat="server"></ajaxToolkit:AutoCompleteExtender>

            </div>
            <div class="left-links">

                <div class="account-link" onclick="redirectToProfile()">
                <img src="/Images/icons8-account-24.png" alt=""> Account
            </div>
            
            <div class="cart-link" id="cartLink" >
                <img src="/Images/icons8-cart-24.png" alt="" onclick="redirectToCart()">Cart
                <img  class="logout-link" src="/Images/icons8-sign-out-24.png" alt="" onclick="redirectToLogin()">Logout
            </div>

            <div>
            </div>
        </div>
        </nav>
    </header>

<section class="contain banner">
<img src="/Images/Green Minimalist Summer Big Sale Medium Banner.png" alt="">
</section>

<section class="contain all-categories">
    <div class="section-heading">
        <h2>Browse Top Categories</h2>
    </div>
    <div class="categories-section">
        <div class="category-card">
            <a href="PLElec.aspx">
            <img src="https://images.unsplash.com/photo-1588459460688-561668329db5?q=80&w=1524&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
            <div class="img-text">Electronics</div>
        </a>
        </div>
        <div class="category-card">
            <a href="PLFurni.aspx">
            <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
            <div class="img-text">Furniture</div>
        </a>
        </div>
        <div class="category-card">
            <a href="PLCloth.aspx">
            <img src="https://images.unsplash.com/photo-1542219550-2da790bf52e9?q=80&w=1450&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
            <div class="img-text">Clothing</div>
        </a>
        </div>
        <div class="category-card">
            <a href="PLShoes.aspx">
            <img src="https://images.unsplash.com/photo-1595341888016-a392ef81b7de?q=80&w=1479&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
            <div class="img-text">Shoes</div>
        </a>
        </div>
        <div class="category-card">
        <a href="PLToys.aspx">
            <img src="https://images.unsplash.com/photo-1587654780291-39c9404d746b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
            <div class="img-text">Toys</div>
        </a>
        </div>
        <div class="category-card">
            <a href="">
            <img src="https://images.unsplash.com/photo-1550399105-c4db5fb85c18?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
            <div class="img-text">Books</div>
        </a>
        </div>
    </div>
</section>

<section class="footer">
    <div class="main-wrapper contain">
        <div class="footer-section-1">
        <img src="/Images/quickcart_logo_green_cropped.png" alt="">
        <div class="phone">+92 3334 45678</div>
        <div class="email">info@quickcart.com</div>
        </div>
        <div class="footer-section-2"><ul>
            <li>About us</li>
            <li>Jobs</li>
            <li>Press</li>
            <li>Blog</li>
        </ul></div>
        <div class="footer-section-3">
            <ul>
                <li>Contact us</li>
                <li>Terms</li>
                <li>Privacy</li>
            </ul>
        </div>
        <div class="footer-section-4">
            <img src="/Images/icons8-instagram-24.png" alt="">
            <img src="/Images/icons8-facebook-24.png" alt="">
            <img src="/Images/icons8-twitter-24.png" alt="">
        </div>
    </div>
</section>
    </form>
</body>
</html>
