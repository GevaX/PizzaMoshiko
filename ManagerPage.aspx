<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManagerPage.aspx.cs" Inherits="ManagerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%if ((bool)Session["isManager"] == true)
        { %>
    <div class="mtable">
        <h3 style="color:white">User table:</h3>
        <%=userList %>
    </div>
    <div class="mtable orders">
        <h3 style="color:white">Order table:</h3>
        <%=orderList %>
    </div>
    <form method="POST">
        <p><label class="lblmsg" for="msg">Enter message to display in website:</label></p>
        <textarea id="msg" name="msg" rows="4" cols="50"><%=cMsg %></textarea>
        <input type="submit" name="submit" value="Update message">
        <input type="submit" class="delete" name="delete" value="Delete current message" />
    </form>
    <div class="mtable workers">
        <h3 style="color:white">Worker table:</h3>
        <%=workerList %>
    </div>
    <button type="button" class="worker-button" onclick="showReg()">Add Worker</button>
    <button type="button" class="worker-button wpassword" onclick="showChp()">Change worker password</button>
    <div class="worker-form" id="worker-form">
        <form method="POST">
            <h1>Worker registration form</h1>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter worker username" required />

            <label for="email">E-mail address:</label>
            <input type="email" id="email" name="email" placeholder="Enter worker E-mail address" required />

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter worker password" required />

            <input type="submit" name="worker" value="Submit" /> <br />
            <input type="reset" value="Reset" />
        </form>
    </div>
    <div class="worker-form" id="password-form">
        <form method="POST">
            <h1>Worker password change form</h1>
            <label for="username">Username:</label>
            <input type="text" id="usernameP" name="usernameP" placeholder="Enter worker username" required />

            <label for="password">Password:</label>
            <input type="password" id="passwordP" name="passwordP" placeholder="Enter worker new password" required />

            <input type="submit" name="worker-password" value="Submit" /> <br />
        </form>
    </div>
    <div id="popupOverlay" class="popup-overlay">
         <div id="popupContent" class="popup-content">
             <h3 id="popupTitle" class="popup-title">Title</h3>
             <p id="popupMessage" class="popup-message">Message</p>
             <button id="popupButton" class="popup-button" onclick="closePopup()">OK</button>
         </div>
     </div>
    <script>
        function showReg() {
            document.getElementById('worker-form').style.display = 'block';
        }

        function showChp() {
            document.getElementById('password-form').style.display = 'block';
        }

        function showPopup(title, message, type) {
            document.getElementById('popupTitle').innerText = title;
            document.getElementById('popupMessage').innerText = message;

            const popupContent = document.getElementById('popupContent');
            popupContent.className = 'popup-content ' + type;

            document.getElementById('popupOverlay').style.display = 'flex';
        }

        function closePopup() {
            document.getElementById('popupOverlay').style.display = 'none';
        }
    </script>
    <%}
        else
        { %>
    <div class="error-container">
        <h1>403</h1>
        <p>Forbidden: You don't have permission to access this resource.</p>
    </div>
    <%} %>
</asp:Content>

