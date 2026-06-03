<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLIO.aspx.cs" Inherits="EComProject.IncomingOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Delivery | Incoming Orders</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="/css/PLIO.css" />

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
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <nav>
        <div class="logo">
            <img src="/Images/quickcart_logo.png" alt="" />
        </div>
        <div class="sub-title">
            Main Menu
        </div>
        <div class="side-links">
            <ul>
                <a href="">
                    <li class="active"><img src="/Images/icons8-product-24.png" alt="" /><span class="hide">Incoming Orders</span></li>
                </a>
                <a href="PLAO.aspx">
                    <li ><img src="/Images/icons8-product-management-24.png" alt=""> <span class="hide">
                            Accepted Orders</span></li>
                </a>
                
            </ul>
        </div>
        <div class="sub-title space">
            General
        </div>
        <div class="side-links">
            <ul>
                <a href="">
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
                <img src="/Images/icons8-product-management-24.png" alt=""> Incoming Orders
            </div>
        </div>
        <div class="main-body">
            <table >
                <thead>
                    <tr border="1">
                        <td>
                            Order ID
                        </td>
                        <td>
                            Customer Name
                        </td>
                        <td rowspan="2">
                            Delivery Address
                        </td>
                        <td>
                            Contact 
                        </td>
                        <td>
                            Total
                        </td>
                        <td>
                            Payment Method
                        </td>
                        <td>
                            Date
                        </td>
                        <td>
                            Actions
                        </td>
                    </tr>
                </thead>
                              
             <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" >
            <ItemTemplate>
            <tbody>
                <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("orderid") %>' />
                        </td>

                        <td>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("u_address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("phoneno") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("total_bill") %>' />
                        </td>
                        <td>Cash On Delivery</td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text='<%# String.Format("{0:MM/dd/yyyy}", Eval("order_date")) %>'  />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" >
                                <asp:ListItem>Order Ready to dispatch from store</asp:ListItem>
                                <asp:ListItem>Accept Order</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
            </tbody>
        </ItemTemplate>
        </asp:ListView>
            </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" SelectCommand="select orderid, name, u_address, phoneno, total_bill, order_date from orders o join users u on o.order_user_id = u.userid join order_details od on o.orderid = od.details_orderid where details_status like 'Order ready to dispatch from store'"></asp:SqlDataSource>
            

            <asp:HiddenField ID="hdnAcceptedOrderId" runat="server" />
            <asp:HiddenField ID="hdnAction" runat="server" />
            <asp:HiddenField ID="hdnOrderId" runat="server" />
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Order Pickup Details</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <div class="input-row">
                                            <label for="">Store Name : </label>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("storename") %>' />
                                        </div>
                                        <div class="input-row">
                                            <label for="">Store Address : </label>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("s_address") %>' />
                                        </div>
                                        <div class="input-row">
                                            <label for="">Phone Number : </label>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("phoneno") %>' />
                                        </div>
                                        <div class="input-row">
                                            <label for="">Product Name : </label>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("ProductName") %>' />
                                        </div>
                                        <div class="input-row">
                                            <label for="">Ordered Quantity : </label>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("details_cquantity") %>' />
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=DESKTOP-1I9I81H\SQLEXPRESS;Initial Catalog=ECom;Integrated Security=True;TrustServerCertificate=True" SelectCommand="SELECT storename, s_address, phoneno, ProductName, details_cquantity FROM users u JOIN store s ON u.userid = s.user_id JOIN products p ON p.store_id = s.storeid JOIN order_details od ON od.details_productid = p.productid WHERE details_orderid = @Oid">
                                    <SelectParameters>
                                        <asp:ControlParameter Name="Oid" ControlID="hdnOrderId" PropertyName="Value" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn close-btn" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="hdnOrderId" EventName="ValueChanged" />
                </Triggers>
        </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>
