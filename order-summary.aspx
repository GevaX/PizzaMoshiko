<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order-summary.aspx.cs" Inherits="order_summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="order-summary" class="order-summary">
        <h2>Order Summary</h2>
        <%=order %>
        <h1>Thank you for ordering with us!</h1>
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
        function showPopup(title, message, type) {
            document.getElementById('popupTitle').innerText = title;
            document.getElementById('popupMessage').innerText = message;
            
            const popupContent = document.getElementById('popupContent');
            popupContent.className = 'popup-content ' + type;
            
            document.getElementById('popupOverlay').style.display = 'flex';
            document.getElementById("order-summary").style.display = 'none';
        }
        
        function closePopup() {
            document.getElementById('popupOverlay').style.display = 'none';

            window.location.href = 'Default.aspx';
        }
    </script>
</asp:Content>

