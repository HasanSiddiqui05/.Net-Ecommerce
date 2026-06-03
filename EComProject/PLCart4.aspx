<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLCart4.aspx.cs" Inherits="EComProject.PLCart14" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuickCart | Cart</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/PLCart4.css">
    <script>
        function redirectToLogin() {
            window.location.href = 'PLLogin.aspx';
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
                            <a href=""><li>Electronics</li></a>
                            <a href=""><li>Furniture</li></a>
                            <a href=""><li>Clothing</li></a>
                            <a href=""><li>Shoes</li></a>
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

            <div>
                <img src="/Images/icons8-sign-out-24.png" alt="" onclick="redirectToLogin()">Logout
            </div>
        </div>
        </nav>
    </header>


    <section class="contain">
      
            
         <div class="wrapper">
            <div class="header">
                <div class="img-container">
                    <img src="/Images/icons8-check-50.png" alt="">
                </div>
                <div class="text-heading">
                    Thank You for Your Order!
                </div>
            </div>
            <div class="order-detail">
                <div class="heading">
                    Transaction Date
                </div>
                <div class="detail">
                    <asp:Label ID="OrderDate" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="order-detail">
                <div class="heading">
                    Payment Method
                </div>
                <div class="detail">
                    Cash On Delivery
                </div>
            </div>
            <div class="orders-detail">
                <div class="heading">
                    Order Summary
                </div>
                <div class="order-summary">
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
                        <button id="cart4btns" runat="server" onserverclick="Cart4Redirect" >Continue Shopping</button>
                    </div>
                </div> 
            </div>
         </div> 
            
            <!-- <div class="order-summary">
                <div class="summary">
                    Order Summary
                </div>
                <div class="summary-row">
                    <div class="summary-heading">Sub Total</div>
                    <div class="summary-total">$799.00</div>
                </div>
                <div class="summary-row">
                    <div class="summary-heading">Tax</div>
                    <div class="summary-total">$0</div>
                </div>
                <div class="summary-row">
                    <div class="summary-heading">Shipping</div>
                    <div class="summary-total">$10.00</div>
                </div>
                <div class="summary-row">
                    <div class="summary-heading">Total</div>
                    <div class="summary-total">$1230.40</div>
                </div>
                <div class="proceed-btn">
                    <button>Continue</button>
                </div>
            </div> -->
       
    </section>
    </form>
</body>
</html>
