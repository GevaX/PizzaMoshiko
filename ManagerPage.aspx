<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManagerPage.aspx.cs" Inherits="ManagerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%if ((bool)Session["isManager"] == true)
        { %>
    <div class="mtable">
        <%=userList %>
    </div>
    <%}
        else
        { %>
    <div class="error-container">
        <h1>403</h1>
        <p>Forbidden: You don't have permission to access this resource.</p>
    </div>
    <%} %>
</asp:Content>

