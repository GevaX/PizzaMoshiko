<%@ Page Language="C#" AutoEventWireup="true" CodeFile="worker.aspx.cs" Inherits="worker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pizza Moshiko Worker</title>
    <link rel="stylesheet" href="worker.css" />
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
    <h1>Hello <%=Session["workerName"] %>!</h1>\
    <div class="mtable">
        <%=orderList %>
    </div>
    
    <%} %>
</body>
</html>
