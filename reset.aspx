<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reset.aspx.cs" Inherits="reset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="reset-page">
        <div class="container">
            <h1>Pizza Moshiko🍕</h1>
            <p>Password reset</p>
            <form>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required />
                <label for="email">E-mail adress:</label>
                <input type="email" id="email" name="email" placeholder="Enter your E-mail adress" required />
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required />
                <input type="submit" value="Submit">
            </form>
        </div>
    </div>
</asp:Content>

