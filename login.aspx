<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            function hasErrors() {
                let hasErrorMessages = Array.from(document.querySelectorAll(".error-message"))
                    .some(msg => msg.textContent.trim() !== "");
                let hasEmptyRequired = Array.from(document.querySelectorAll("input[required]"))
                    .some(field => field.value.trim() === "");

                return hasEmptyRequired || hasErrorMessages;
            }

            function toggleSubmitButton() {
                const submitButton = document.querySelector("input[type=submit]");
                const hasErr = hasErrors();

                submitButton.classList.toggle("disabled", hasErr);
            }

            // Check if required inputs entered
            function validateRequiredField(field) {
                const value = field.value.trim();
                const messageField = document.getElementById(field.id + "-error");

                if (field.id === "confirmPassword" && document.getElementById("password").value.trim() === "") return;

                if (value === "") {
                    messageField.textContent = "This field is required.";
                    field.classList.add("error");
                }
                else {
                    messageField.textContent = "";
                    field.classList.remove("error");
                }

                toggleSubmitButton();
            }

            document.querySelectorAll("input[required]").forEach(function (input) {
                input.addEventListener("blur", function () {
                    validateRequiredField(this);
                });
            });

            document.querySelector("form").addEventListener("submit", function (e) {
                if (document.querySelector(".disabled")) {
                    e.preventDefault();
                    document.querySelectorAll("input[required]").forEach(function (input) {
                        validateRequiredField(input);
                    });
                }
            });

            toggleSubmitButton();
        });
    </script>
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
                    <span id="email-error" class="error-message"></span> <br />

                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required />
                    <span id="password-error" class="error-message"></span> <br />

                    <input type="submit" name="submit" value="Log in">
                </form>
            <p>Dont have an account? <a href="register.aspx">Sign Up</a></p> 
            <p>Forgot password? <a href="reset.aspx">Reset it</a></p> 
            <%=msg %>
        </div>
    </div>
</asp:Content>

