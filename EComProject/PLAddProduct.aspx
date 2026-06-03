<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLAddProduct.aspx.cs" Inherits="EComProject.AddProductPL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller | Add Product</title>
    <link rel="stylesheet" href="/css/PLAP.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
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
                <a href="">
                    <li class="active"><img src="/Images/icons8-product-24.png" alt="">Add Products</li>
                </a>
                <a href="PLUI.aspx">
                    <li><img src="/Images/icons8-product-management-24.png" alt=""> Update Inventory</li>
                </a>
                <a href="PLViewInventory.aspx">
                    <li>
                        <img src="/Images/icons8-warehouse-24.png" alt="">View Inventory
                    </li>
                </a>
                <a href="PLOrders.aspx">
                    <li>
                        <img src="/Images/icons8-order-history-24.png" alt="">Orders
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
                    <li><img src="/Images/icons8-account-24.png" alt="">Profile</li>
                </a>
                <a href="PLLogin.aspx">
                    <li><img src="/Images/icons8-sign-out-24.png" alt=""> Sign Out</li>
                </a>
            </ul>
        </div>
    </nav>

    <div class="main-content">
        <div class="header">
            <div class="heading">
                <img src="/Images/icons8-product-24.png" alt=""> Add New Product
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </div>
            <div class="add-btn">
                <button type="submit" id="Button1" runat="server" onserverclick="Button1_Click"><img src="/Images/icons8-check-24.png" alt=""> Add Product</button>
            </div>
        </div>
        <div class="content">
            <div class="col-1">
                <div class="general-info">
                    <div class="col-heading">
                        General Information
                    </div>
                    <div class="input-row">
                        <label for="">Product Name</label>
                        <asp:TextBox type="text" name="" ID="TextBox1" runat="server" required></asp:TextBox>
                    </div>
                    <div class="input-row">
                        <label for="">Product Description</label>
                        <textarea name="textbox2" id="" rows="6" required></textarea>
                    </div>
                </div>
            </div>
            <div class="col-2">
                <div class="col-heading">
                    Upload Image
                </div>
                <div class="image-container">
                    <div class="image-holder">
                        <img src="" alt="" id="placeholder" class="placeholder">
                    </div>
                    <label class="Upload">Select Image 
                        <input type="file" class="img-btn"/>
                    <asp:FileUpload ID="FileUpload1" runat="server" class="img-btn" onchange="GetPreviewImage(event);"/>
                </label>
                </div>
            </div>
            <div class="col-1 row-2">
                <div class="col-heading">
                    Pricing & Stock
                </div>
                <div class="row-2-content">
                    <div class="input-row ">
                        <label for="">Price</label>
                        <input type="text" name="textbox3" id="" required>
                    </div>
                    <div class="input-row">
                        <label for="">Stock</label>
                        <input type="number" name="textbox4" id="t" required>
                    </div>
                </div>
            </div>
            <div class="col-2 row-2">
                <div class="col-heading">
                    Category
                </div>
                <div class="input-row">
                    <label for="">Product Category</label>
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
        </div>
    </div>
<script>
   FileUpload1.onchange = evt =>{
        const[file] =FileUpload1.files

        if(file){
            placeholder.src=URL.createObjectURL(file)
            placeholder.style.display = 'block';
        }
   }
</script>
    </form>
</body>
</html>
