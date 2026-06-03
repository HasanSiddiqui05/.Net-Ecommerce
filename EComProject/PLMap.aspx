<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLMap.aspx.cs" Inherits="EComProject.PLMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>QuickCart | Delivery</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <link rel="stylesheet" href="/css/PLMap.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet" />
    <style>
        #map {
            height: 500px;
            width: 100%;
        }
        .input-form {
            margin-bottom: 10px;
        }
    </style>
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
                <a href="PLIO.aspx">
                    <li ><img src="/Images/icons8-product-24.png" alt=""><span class="hide">Incoming Orders</span></li>
                </a>
                <a href="PLAO.aspx">
                    <li class="active"><img src="/Images/icons8-product-management-24.png" alt=""> <span class="hide">
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
                    <li><img src="/Images/icons8-account-24.png" alt=""><span class="hide" />Profile</span></li>
                </a>
                <a href="PLLogin.aspx">
                    <li><img src="/Images/icons8-sign-out-24.png" alt=""><span class="hide" />Sign Out</span></li>
                </a>
            </ul>
        </div>
    </nav>
 
    <div class="page-title"><img src="/Images/icons8-map-24.png" alt="">Address Locator</div>
    <div class="input-form">
        <input id="address" placeholder="Enter an address" runat="server" />
        <input type="button" value="Search" id="search-btn" onclick="geocodeAddress()" />
    </div>
    <div id="map"></div>

    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script>
        // Initialize the map
        const map = L.map('map').setView([51.505, -0.09], 13);

        // Add OpenStreetMap tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);

        let marker;

        // Geocode the address and place a marker
        function geocodeAddress() {
            const address = document.getElementById('address').value;
            const url = `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(address)}`;

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    if (data.length > 0) {
                        const { lat, lon } = data[0];
                        map.setView([lat, lon], 13);

                        if (marker) {
                            map.removeLayer(marker); // Remove the old marker
                        }

                        marker = L.marker([lat, lon]).addTo(map)
                            .bindPopup(`<b>${address}</b>`)
                            .openPopup();
                    } else {
                        alert('Address not found');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('An error occurred while geocoding the address');
                });
        }
    </script>
    </form>
</body>

</html>
