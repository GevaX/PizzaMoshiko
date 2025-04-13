<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

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

            function checkAvailability(field, value) {
                fetch("checkUser.aspx?" + field + "=" + encodeURIComponent(value))
                    .then(response => response.text())
                    .then(response => {
                        const messageField = document.getElementById(field + "-error");
                        const inputField = document.getElementById(field);

                        if (response.trim() === "exists") {
                            messageField.textContent = field.charAt(0).toUpperCase() + field.slice(1) + " already exists.";
                            inputField.classList.add("error");
                        } else {
                            messageField.textContent = "";
                            inputField.classList.remove("error");
                        }

                        toggleSubmitButton();
                    });
            }

            function checkEmailFormat(email) {
                const inputField = document.getElementById("email");
                const emailError = document.getElementById("email-error");
                const emailRegex = /^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$/gim;

                if (!emailRegex.test(email)) {
                    emailError.textContent = "Entered email is not a valid address.";
                    inputField.classList.add("error");
                } else {
                    emailError.textContent = "";
                    inputField.classList.remove("error");
                }

                toggleSubmitButton();
            }

            function validatePassword(password) {
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
                } else {
                    passwordError.textContent = "";
                    inputField.classList.remove("error");
                }

                toggleSubmitButton();
            }

            function validatePasswordMatch() {
                const password = document.getElementById("password");
                const confirmPassword = document.getElementById("confirmPassword");
                const errorMessage = document.getElementById("confirmPassword-error");

                if (password.classList.contains("error")) return;

                if (password.value.trim() === "" || confirmPassword.value.trim() === "") {
                    // Don't validate if one of them is empty
                    password.classList.remove("success", "perror");
                    confirmPassword.classList.remove("success", "perror");
                    errorMessage.textContent = "";
                    toggleSubmitButton();
                    return;
                }

                if (password.value === confirmPassword.value) {
                    password.classList.add("success");
                    confirmPassword.classList.add("success");
                    password.classList.remove("perror");
                    confirmPassword.classList.remove("perror");
                    errorMessage.textContent = "";
                } else {
                    password.classList.add("perror");
                    confirmPassword.classList.add("perror");
                    password.classList.remove("success");
                    confirmPassword.classList.remove("success");
                    errorMessage.textContent = "Passwords do not match.";
                }

                toggleSubmitButton();
            }

            function validateNameField(field, value, label) {
                let messageField = document.getElementById(field + "-error");
                let inputField = document.getElementById(field);
                const validName = /^[A-Za-z\s'-]+$/.test(value); // Allows letters, spaces, apostrophes, hyphens

                if (!validName && value.length > 0) {
                    messageField.textContent = label + " must not contain numbers or special characters.";
                    inputField.classList.add("error");
                } else {
                    messageField.textContent = "";
                    inputField.classList.remove("error");
                }

                toggleSubmitButton();
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

                toggleSubmitButton();
            }

            document.getElementById("username").addEventListener("input", function () {
                const username = this.value.trim();
                const messageField = document.getElementById("username-error");

                if (username.length < 3 || username.length > 14) {
                    if (username.length < 3) {
                        messageField.textContent = "Username must be 3 characters or longer";
                    }
                    else {
                        messageField.textContent = "Username must be 15 characters or shorter";
                    }
                    this.classList.add("error");
                }
                else {
                    messageField.textContent = "";
                    this.classList.remove("error");
                    checkAvailability("username", username);
                }

                toggleSubmitButton();
            });

            document.getElementById("email").addEventListener("blur", function () {
                const email = this.value.trim();
                if (email.length > 0) {
                    checkEmailFormat(email);

                    const emailError = document.getElementById("email-error");
                    if (emailError.textContent === "") {
                        checkAvailability("email", email);
                    }
                }
            });

            document.getElementById("password").addEventListener("input", function () {
                validatePassword(this.value);
            });

            document.getElementById("confirmPassword").addEventListener("input", validatePasswordMatch);
            // Prevent pasting into confirm password input
            document.getElementById("confirmPassword").addEventListener("paste", function (e) {
                e.preventDefault();
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

            document.querySelectorAll("input[required]").forEach(function (input) {
                input.addEventListener("blur", function () {
                    validateRequiredField(this);
                    toggleSubmitButton();
                });
            });

            toggleSubmitButton();

            document.querySelector("form").addEventListener("submit", function (e) {
                if (document.querySelector(".disabled")) {
                    e.preventDefault();
                    document.querySelectorAll("input[required]").forEach(function (input) {
                        validateRequiredField(input);
                    });
                }
            });


            document.querySelector("form").addEventListener("reset", function () {
                let errorFields = document.querySelectorAll(".error-message");
                let inputFields = document.querySelectorAll("input");

                errorFields.forEach(function (field) {
                    field.textContent = "";
                });

                inputFields.forEach(function (field) {
                    field.classList.remove("error");
                });

                toggleSubmitButton();
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
                <label for="username" class="required">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required />
                <span id="username-error" class="error-message"></span> <br />

                <label for="email" class="required">E-mail address</label>
                <input type="email" id="email" name="email" placeholder="Enter your E-mail address" required />
                <span id="email-error" class="error-message"></span> <br />

                <label for="password" class="required">Password</label>
                <div class="input-wrapper">
                    <input type="password" id="password" name="password" placeholder="Enter your password" required />
                    <span class="eye-icon" onclick="toggleVisibility('password', this)"><i class="fas fa-eye"></i></span>
                </div>
                <span id="password-error" class="error-message"></span> <br />

                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required />
                <span id="confirmPassword-error" class="error-message"></span> <br />

                <label for="fname" class="required">First name</label>
                <input type="text" id="fname" name="fname" placeholder="Enter your first name" required />
                <span id="fname-error" class="error-message"></span> <br />

                <label for="lname" class="required">Last name</label>
                <input type="text" id="lname" name="lname" placeholder="Enter your last name" required />
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

                <label for="age" class="required">Select Age</label>
                <input type="number" id="age" name="age" min="1" max="120" placeholder="Enter your age" required /> <br />
                <span id="age-error" class="error-message"></span> <br />

                <label for="topping">Favorite Topping:</label>
                <input type="text" id="topping" name="topping" placeholder="Yes, even pineapple is acceptable!">

                <label for="crust">Crust Preference:</label>
                <select id="crust" name="crust">
                  <option value="">-- No selection --</option>
                  <option value="thin">Thin</option>
                  <option value="thick">Thick</option>
                  <option value="extra-crispy">Extra Crispy</option>
                  <option value="surprise-me">Surprise Me!</option>
                </select> <br />

                <label for="cheese">Cheese Level:</label>
                <select id="cheese" name="cheese">
                  <option value="">-- No selection --</option>
                  <option value="regular">Regular</option>
                  <option value="extra">Extra</option>
                  <option value="all-the-cheese">All the Cheese!</option>
                </select> <br />

                <label for="spicy">Spicy or Not:</label>
                <select id="spicy" name="spicy">
                  <option value="">-- No selection --</option>
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

