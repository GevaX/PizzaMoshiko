<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order-history.aspx.cs" Inherits="order_history" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <% if (Session["userName"] == null)
        { %>
        <div class="login-container">     
            <div>
                <h1>Can't acsses this page</h1>
                <p>In order to see order history you need to have an account</p>
                <a class="login" href="Login.aspx">Login</a>
            </div>
            <img src="assets/img/pizza-slice.png" />
        </div>
    <% }
        else
        { %>
    <div id="order-summary" class="order-summary">
        <h2>Order History</h2>
        <%if (orders == "")
            { %>
        <h3>No orders found.</h3>
        <%}
            else { Response.Write(orders); } %>
        <img src="assets/logo inc.png" alt="Pizza Moshiko Logo" height="100px"/>
    </div>
    <%} %>
</asp:Content>

