<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLRegistration.aspx.cs" Inherits="EComProject.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SignUp | E-Commerce</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="/css/PLRegistration.css" />
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
        <div class="wrapper">
        <div class="title">Registration</div>
        
            <div class="input-row">
                <div class="input-div">
                    <label for="fname">Full Name</label>
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Your Full Name" required></asp:TextBox>
                </div>
                <div class="input-div">
                    <label for="email">Email</label>
                    <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Your Email" required></asp:TextBox>
                </div>
            </div>

            <div class="input-row">
                <div class="input-div">
                    <label for="phone">Phone Number</label>
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter Your Phone Number" required></asp:TextBox>
                </div>
                <div class="input-div">
                    <label for="address">Address</label>
                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Enter Your Address" required></asp:TextBox>
           
                </div>
            </div>

            <div class="input-row">
                <div class="input-div">
                    <label for="pass">Password</label>
                    <asp:TextBox type="Password" ID="TextBox5" runat="server" placeholder="Enter Password" required></asp:TextBox>
                </div>
                <div class="input-div">
                    <label for="repass">Confirm Password</label>
                    <asp:TextBox type="Password" ID="TextBox6" runat="server" placeholder="Confirm Password" required></asp:TextBox>
                </div>
            </div>
            <div class="div-input radio">
                <div>
                    <label for="option">Select Type</label>
                </div>
                <div class="options">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="31px" Width="138px" style="text-align: center" required>
                    <asp:ListItem>Customer</asp:ListItem>
                    <asp:ListItem>Seller</asp:ListItem>
                    <asp:ListItem>Delivery</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="center">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="text-align: center" Text="Register" />
            </div>
        </div>

    
        <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Account Verification</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="input-row">
                            <label for="">Enter OTP</label>
                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        </div>
                    <div class="modal-footer">
                        <button type="button" class="btn close-btn" data-dismiss="modal">Close</button>
                        <button type="button" class="btn save-btn" runat="server" onserverclick="Button2_Click">Verify</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
