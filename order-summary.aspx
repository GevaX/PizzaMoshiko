<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order-summary.aspx.cs" Inherits="order_summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="order-summary" class="order-summary">
        <h2>Order Summary</h2>
        <%=order %>
        <h1>Thank you for ordering with us!</h1>
        <%if (status != "completed" && status != "delivered" && status != "canceled") {%>
          <button class="delete" style="font-size: 20px;" onclick="cancelOrder(<%=orderId %>)">Ceancel Order</button> <br />
        <% } %>
        <img src="assets/logo inc.png" alt="Pizza Moshiko Logo" height="100px"/> <br />
        <a href="order-history.aspx" style="color: green; font-size: 20px;">Order History</a>
    </div>
    <div id="popupOverlay" class="popup-overlay">
         <div id="popupContent" class="popup-content">
             <h3 id="popupTitle" class="popup-title">Title</h3>
             <p id="popupMessage" class="popup-message">Message</p>
             <button id="popupButton" class="popup-button" onclick="closePopup()">OK</button>
         </div>
     </div>
    <script type="text/javascript">
        function cancelOrder(id) {
            fetch('updateStatus.aspx?id=' + encodeURIComponent(id) + '&status=canceled')
            .then(response => response.text())
            .then(data => {
                if (data.trim() !== 'success') {
                    alert('Failed to cancel order: ' + data);
                }
            })
            .catch(error => {
                alert('Error: ' + error);
            });
            showPopup('Success', 'Order canceled scssesfuly', 'success')
        }

        function confirmDelivery() {
            fetch('updateStatus.aspx?id=' + encodeURIComponent(<%=orderId %>) + '&status=completed')
                .then(response => response.text())
                .then(data => {
                    if (data.trim() !== 'success') {
                        alert('Failed to complete order: ' + data);
                    }
                })
                .catch(error => {
                    alert('Error: ' + error);
                });
        }

        function showPopup(title, message, type) {
            document.getElementById('popupTitle').innerText = title;
            document.getElementById('popupMessage').innerText = message;

            const button = document.getElementById('popupButton');
            const popupContent = document.getElementById('popupContent');

            const existingContactButton = document.querySelector('.popup-button .contact');
            if (existingContactButton) {
                existingContactButton.remove();
            }

            if (type == "delivery") {
                button.innerText = "Confirm delivery";
                const contactButton = document.createElement("button");
                contactButton.textContent = "Contact us";
                contactButton.className = "popup-button contact";
                contactButton.onclick = function () {
                    window.open("/Contact.aspx", "_blank");
                }
                popupContent.appendChild(contactButton);

                button.onclick = function () {
                    confirmDelivery();
                };
            }

            popupContent.className = 'popup-content ' + type;

            document.getElementById('popupOverlay').style.display = 'flex';
            if (type == 'error') {
                document.getElementById("order-summary").style.display = 'none';
            }
        }
        
        function closePopup() {
            document.getElementById('popupOverlay').style.display = 'none';

            window.location.href = 'Default.aspx';
        }
    </script>
    <% if (status == "delivered") { %>
        <script>
            showPopup("Order delivered", "Your order has been delivered to your address. If you have not received the order, contact us! Otherwise, confirm delivery.", "delivery");
        </script>
    <% } %>
</asp:Content>

