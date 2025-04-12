<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            function checkAvailability(field, value) {
                fetch("checkUser.aspx?" + field + "=" + encodeURIComponent(value))
                    .then(response => response.text())
                    .then(response => {
                        let messageField = document.getElementById(field + "-error");
                        let inputField = document.getElementById(field);
                        let submitButton = document.querySelector("input[type=submit]");

                        if (response.trim() === "exists") {
                            messageField.textContent = field.charAt(0).toUpperCase() + field.slice(1) + " already exists.";
                            inputField.classList.add("error");
                            submitButton.disabled = true;
                        } else {
                            messageField.textContent = "";
                            inputField.classList.remove("error");

                            if (!document.getElementById("username-error").textContent &&
                                !document.getElementById("email-error").textContent &&
                                !document.getElementById("password-error").textContent &&
                                !document.getElementById("fname-error").textContent &&
                                !document.getElementById("lname-error").textContent) {
                                submitButton.disabled = false; 
                            }
                        }
                    });
            }
            document.getElementById("username").addEventListener("blur", function () {
                let username = this.value.trim();
                if (username.length > 0) {
                    checkAvailability("username", username);
                }
            });

            document.getElementById("email").addEventListener("blur", function () {
                let email = this.value.trim();
                if (email.length > 0) {
                    checkAvailability("email", email);
                }
            });

            document.getElementById("password").addEventListener("blur", function () {
                let password = this.value.trim();
                let passwordError = document.getElementById("password-error");
                let submitButton = document.querySelector("input[type=submit]");
                let passwordValid = password.length >= 6 && password.length <= 20 &&
                    /[0-9]/.test(password) && /[!@#$%^&*(),.?":{}|<>]/.test(password) && /[a-zA-Z]/.test(password);

                if (!passwordValid) {
                    if (password.length < 6 || password.length > 20) {
                        passwordError.textContent = "Password must be between 6-20 characters.";
                    }
                    else if (!/[0-9]/.test(password)) {
                        passwordError.textContent = "Password must include at least one number.";
                    }
                    else if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
                        passwordError.textContent = "Password must include at least one special character.";
                    }
                    else if (!/[a-zA-Z]/.test(password)) {
                        passwordError.textContent = "Password must include either a lowercase or an uppercase letter.";
                    }
                    this.classList.add("error");
                    submitButton.disabled = true;
                } else {
                    passwordError.textContent = "";
                    this.classList.remove("error");

                    if (!document.getElementById("username-error").textContent &&
                        !document.getElementById("email-error").textContent &&
                        !document.getElementById("fname-error").textContent &&
                        !document.getElementById("lname-error").textContent) {
                        submitButton.disabled = false;
                    }
                }
            });

            document.getElementById("fname").addEventListener("blur", function () {
                let fname = this.value.trim();
                if (fname.length > 0) {
                    validateNameField("fname", fname, "First Name");
                }
            });

            document.getElementById("lname").addEventListener("blur", function () {
                let lname = this.value.trim();
                if (lname.length > 0) {
                    validateNameField("lname", lname, "Last Name");
                }
            });

            function validateNameField(field, value, label) {
                let messageField = document.getElementById(field + "-error");
                let inputField = document.getElementById(field);
                let submitButton = document.querySelector("input[type=submit]");
                const validName = /^[A-Za-z\s'-]+$/.test(value); // Allows letters, spaces, apostrophes, hyphens

                if (!validName && value.length > 0) {
                    messageField.textContent = label + " must not contain numbers or special characters.";
                    inputField.classList.add("error");
                    submitButton.disabled = true;
                } else {
                    messageField.textContent = "";
                    inputField.classList.remove("error");

                    if (!document.getElementById("username-error").textContent &&
                        !document.getElementById("email-error").textContent &&
                        !document.getElementById("password-error").textContent &&
                        !document.getElementById("fname-error")?.textContent &&
                        !document.getElementById("lname-error")?.textContent) {
                        submitButton.disabled = false;
                    }
                }
            }

            document.querySelector("form").addEventListener("reset", function () {
                let errorFields = document.querySelectorAll(".error-message");
                let inputFields = document.querySelectorAll("input");

                errorFields.forEach(function (field) {
                    field.textContent = "";
                });

                inputFields.forEach(function (field) {
                    field.classList.remove("error");
                });

                document.querySelector("input[type=submit]").disabled = false;
            });
        });
    </script>
    <div class="form">
        <div style="margin-right: 300px; margin-left: 100px">
            <h1>Do you love pizza? 🍕</h1>
            <p style="max-width: 500px;">Register now for the fast-growing pizza empire of Pizza Moshiko built by the master pizzaiolo moshiko now, and join a comunity of around 400 pizza lovers located at the streets of Petah Tikva.</p>
        </div>
        <div class="container">
        <h1>Sign Up</h1>
            <form action="/submit" method="POST">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required />
                <span id="username-error" class="error-message"></span> <br />

                <label for="email">E-mail address:</label>
                <input type="email" id="email" name="email" placeholder="Enter your E-mail address" required />
                <span id="email-error" class="error-message"></span> <br />

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required />
                <span id="password-error" class="error-message"></span> <br />

                <label for="fname">First name:</label>
                <input type="text" id="fname" name="fname" placeholder="Enter your first name"  />
                <span id="fname-error" class="error-message"></span> <br />

                <label for="lname">Last name:</label>
                <input type="text" id="lname" name="lname" placeholder="Enter your last name"  />
                <span id="lname-error" class="error-message"></span> <br />

                <label>Gender</label>
                <div class="gender">
                  <input type="radio" id="male" name="gender" value="Male">
                  <label for="male">Male</label><br>
                  <input type="radio" id="female" name="gender" value="Female">
                  <label for="female">Female</label><br>
                  <input type="radio" id="pizza" name="gender" value="Pizza">
                  <label for="pizza">Pizza</label>
                </div>
                <label for="age">Select Age:</label>
                <input type="number" id="age" name="age" min="1" max="120" placeholder="Enter your age" required /> <br />
                <label for="topping">Favorite Topping:</label>
                <input type="text" id="topping" name="topping" placeholder="Yes, even pineapple is acceptable!">

                <label for="crust">Crust Preference:</label>
                <select id="crust" name="crust">
                  <option value="thin">Thin</option>
                  <option value="thick">Thick</option>
                  <option value="extra-crispy">Extra Crispy</option>
                  <option value="surprise-me">Surprise Me!</option>
                </select> <br />

                <label for="cheese">Cheese Level:</label>
                <select id="cheese" name="cheese">
                  <option value="regular">Regular</option>
                  <option value="extra">Extra</option>
                  <option value="all-the-cheese">All the Cheese!</option>
                </select> <br />

                <label for="spicy">Spicy or Not:</label>
                <select id="spicy" name="spicy">
                  <option value="mild">Mild</option>
                  <option value="medium">Medium</option>
                  <option value="spicy">Spicy</option>
                  <option value="fire">Fire in My Mouth!</option>
                </select> <br />
                <input type="submit" name="submit" value="Submit"> <br />
                <input type="reset" value="Reset">
            </form>
            <p>Already have an account? <a href="login.aspx">Sign In</a></p> 
        </div>
    </div>
    <div id="popupOverlay" class="popup-overlay">
         <div id="popupContent" class="popup-content">
             <h3 id="popupTitle" class="popup-title">Title</h3>
             <p id="popupMessage" class="popup-message">Message</p>
             <button id="popupButton" class="popup-button" onclick="closePopup()">OK</button>
         </div>
     </div>
    <script>
        function showPopup(title, message, type) {
            document.getElementById('popupTitle').innerText = title;
            document.getElementById('popupMessage').innerText = message;

            const popupContent = document.getElementById('popupContent');
            popupContent.className = 'popup-content ' + type;

            document.getElementById('popupOverlay').style.display = 'flex';
        }

        function closePopup() {
            document.getElementById('popupOverlay').style.display = 'none';

            if (document.getElementById('popupContent').classList.contains('success')) {
                window.location.href = 'Default.aspx';
            }
        }
    </script>
</asp:Content>

