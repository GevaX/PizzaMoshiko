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
    <%}
        else
        { %>
    <div class="error-container">
        <h1>403</h1>
        <p>Forbidden: You don't have permission to access this resource.</p>
    </div>
    <%} %>
</asp:Content>

