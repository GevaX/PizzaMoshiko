<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form">
        <div style="margin-right: 300px; margin-left: 100px">
            <h1>Log-In 🍕</h1>
            <p style="max-width: 500px;">Sign in into your pizza moshiko account</p>
        </div>
        <div class="container">
            <h1>Sign In</h1>
                <form action="/submit" method="POST">
                    <label for="email">E-mail adress:</label>
                    <input type="email" id="email" name="email" placeholder="Enter your E-mail adress" required />
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required />
                    <input type="submit" name="submit" value="Log in">
                </form>
            <p>Dont have an account? <a href="register.aspx">Sign Up</a></p> 
            <p>Forgot password? <a href="reset.aspx">Reset it</a></p> 
            <%=msg %>
        </div>
    </div>
</asp:Content>

