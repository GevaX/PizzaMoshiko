<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="reg">
        <div style="margin-right: 300px; margin-left: 100px">
            <h1>Do you love pizza? 🍕</h1>
            <p style="max-width: 500px;">Register now for the fast-growing pizza empire of Pizza Moshiko built by the master pizzaiolo moshiko now, and join a comunity of around 400 pizza lovers located at the streets of Petah Tikva.</p>
        </div>
        <div class="container">
        <h1>Sign Up</h1>
            <form action="/submit" method="POST">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required />
                <label for="email">E-mail adress:</label>
                <input type="email" id="email" name="email" placeholder="Enter your E-mail adress" required />
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required />

                <label for="fname">First name:</label>
                <input type="text" id="fname" name="fname" placeholder="Enter your first name"  />
                <label for="lname">Last name:</label>
                <input type="text" id="lname" name="lname" placeholder="Enter your last name"  />

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
                <select id="age" name="age">
                  <option value="1to13">1-13</option>
                  <option value="13to18">13-18</option>
                  <option value="19to30">19-30</option>
                  <option value="31to45">31-45</option>
                  <option value="46to60">46-60</option>
                  <option value="61plus">61 and above</option>
                </select> <br />
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
                <input type="submit" value="Submit"> <br />
                <input type="reset" value="Reset">
            </form>
        </div>
    </div>
    
</asp:Content>

