<%@ Page Language="C#" AutoEventWireup="true" CodeFile="worker.aspx.cs" Inherits="worker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pizza Moshiko Worker</title>
    <link rel="stylesheet" href="worker.css" />
    <link href="https://fonts.googleapis.com/css2?family=Heebo&display=swap" rel="stylesheet" />
</head>
<body>
    <%if (Session["workerName"] == null)
        { %>
    <div class="worker-form">
        <form method="post">
            <h1>Worker Log-In form</h1>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter worker username" required />

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter worker new password" required />

            <input type="submit" name="submit" value="Submit" /> <br />
        </form>
    </div>
    <%}
        else
        { %>
    <h1>Hello <%=Session["workerName"] %>!</h1>
    <div class="mtable" id="c-orders">
        <%=orderList %>
    </div>
    <div class="mtable hidden" id="p-orders">
        <h1>Past orders:</h1>
        <%=pastOrderList %>
    </div>
    <a href="#" id="button" onclick="switchTables(0); return false;">Show past orders</a>
    <script>
        function switchTables(op) {
            const cOrders = document.getElementById('c-orders');
            const pOrders = document.getElementById('p-orders');
            const button = document.getElementById('button');
            if (op === 0) {
                cOrders.style.display = 'none';
                pOrders.style.display = 'block';
                button.onclick = function () {
                    switchTables(1);
                }
                button.innerText = "Show current orders";
            }
            else if (op === 1) {
                cOrders.style.display = 'block';
                pOrders.style.display = 'none';
                button.onclick = function () {
                    switchTables(0);
                }
                button.innerText = "Show past orders";
            }
        }
    </script>
    <%} %>
    <% if (ViewState["LoginFailed"] != null && (bool)ViewState["LoginFailed"]) { %>
        <script>alert('Login failed. Please try again.');</script>
    <% } %>
</body>
</html>
