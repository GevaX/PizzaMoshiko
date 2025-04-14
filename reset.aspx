<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reset.aspx.cs" Inherits="reset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>
        // Password eye icon visibility toggle
        function toggleVisibility(fieldId, icon) {
            const input = document.getElementById(fieldId);
            const isPassword = input.type === "password";
            input.type = isPassword ? "text" : "password";
            icon.querySelector("i").className = isPassword ? "fas fa-eye-slash" : "fas fa-eye";
        }

        //----Input Validation----
        document.addEventListener("DOMContentLoaded", function () {
            function validatePassword(password) {
                const submitButton = document.querySelector("input[type=submit]");
                const passwordError = document.getElementById("password-error");
                const inputField = document.getElementById("password");
                const isValid = password.length >= 6 &&
                    password.length <= 20 &&
                    /[0-9]/.test(password) &&
                    /[!@#$%^&*(),.?":{}|<>]/.test(password) &&
                    /[a-zA-Z]/.test(password);

                if (!isValid) {
                    if (password.length < 6 || password.length > 20) {
                        passwordError.textContent = "Password must be between 6–20 characters.";
                    }
                    else if (!/[0-9]/.test(password)) {
                        passwordError.textContent = "Password must include at least one number.";
                    }
                    else if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
                        passwordError.textContent = "Password must include at least one special character.";
                    }
                    else if (!/[a-zA-Z]/.test(password)) {
                        passwordError.textContent = "Password must include a letter.";
                    }
                    inputField.classList.add("error");
                    submitButton.disabled = true;
                } else {
                    passwordError.textContent = "";
                    inputField.classList.remove("error");
                    submitButton.disabled = false;
                }
            }

            function validatePasswordMatch() {
                const submitButton = document.querySelector("input[type=submit]");
                const password = document.getElementById("password");
                const confirmPassword = document.getElementById("confirmPassword");
                const errorMessage = document.getElementById("confirmPassword-error");

                if (password.value.trim() === "" || confirmPassword.value.trim() === "" || password.classList.contains("error")) {
                    // Don't validate if one of them is empty
                    password.classList.remove("success", "perror");
                    confirmPassword.classList.remove("success", "perror");
                    errorMessage.textContent = "";
                    submitButton.disabled = true;
                    return;
                }

                if (password.value === confirmPassword.value) {
                    password.classList.add("success");
                    confirmPassword.classList.add("success");
                    password.classList.remove("perror");
                    confirmPassword.classList.remove("perror");
                    errorMessage.textContent = "";
                    submitButton.disabled = false;
                } else {
                    password.classList.add("perror");
                    confirmPassword.classList.add("perror");
                    password.classList.remove("success");
                    confirmPassword.classList.remove("success");
                    errorMessage.textContent = "Passwords do not match.";
                    submitButton.disabled = true;
                }
            }

            document.getElementById("password").addEventListener("input", function () {
                validatePassword(this.value);
                validatePasswordMatch();
            });

            document.getElementById("confirmPassword").addEventListener("input", validatePasswordMatch);
            // Prevent pasting into confirm password input
            document.getElementById("confirmPassword").addEventListener("paste", function (e) {
                e.preventDefault();
            });
        });
    </script>
    <div class="reset-page">
        <div class="container">
            <h1>Pizza Moshiko🍕</h1>
            <p>Password reset</p>
            <form action="/submit" method="POST">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required />
                <label for="email">E-mail adress:</label>
                <input type="email" id="email" name="email" placeholder="Enter your E-mail adress" required />
                <label for="password">Password</label>
                <div class="input-wrapper">
                    <input type="password" id="password" name="password" placeholder="Enter your password" required />
                    <span class="eye-icon" onclick="toggleVisibility('password', this)"><i class="fas fa-eye"></i></span>
                </div>
                <span id="password-error" class="error-message"></span> <br />

                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required />
                <span id="confirmPassword-error" class="error-message"></span> <br />

                <input type="submit" name="submit" value="Submit">
            </form>
        </div>
    </div>
</asp:Content>

