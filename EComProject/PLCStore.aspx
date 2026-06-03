<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLCStore.aspx.cs" Inherits="EComProject.PLCStore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller | Create Store</title>
    <link rel="stylesheet" href="/css/PLCS.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <nav>
        <div class="logo">
            <img src="/Images/quickcart_logo.png" alt="" >
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
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </div>
                <div class="input-row">
                    <label for="">Store Description</label>
                    <textarea name="TextBox2" id="" rows="8" required ></textarea>
                </div>
            </div>
            <div class="section-2">
                <div class="col-heading">
                    Contact Information
                </div>
                <div class="row-content">
                    <div class="input-row">
                        <label for="">Contact Number</label>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-row">
                        <label for="">Address</label>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-row">
                        <label for="">Email</label>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="section-3">
            <div class="btn-row">
                <button class="save-btn" runat="server" onserverclick="Button1_Click">Create Store</button>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
