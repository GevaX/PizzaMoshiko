<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <% if (Session["userName"] == null) { %>
        <div class="login-container">     
            <div>
                <h1>Can't acsses this page</h1>
                <p>In order to order you need to have an account</p>
                <a class="login" href="Login.aspx">Login</a>
            </div>
            <img src="assets/img/pizza-slice.png" />
        </div>
    <% } else { %>
        <div class="order-form">
            <h2>Order Your Pizza</h2>
            <form method="post" action="/submit">
                <label for="pizza">Choose Pizza:</label>
                <select name="pizza" id="pizza" required>
                    <option>Margherita</option>
                    <option>Pepperoni</option>
                    <option>Veggie Supreme</option>
                    <option>BBQ Chicken</option>
                    <option>Four Cheese</option>
                    <option>Hawaiian</option>
                </select>

                <label for="size">Select Size:</label>
                <select name="size" id="size" required>
                    <option>Small</option>
                    <option>Medium</option>
                    <option>Large</option>
                    <option>Extra Large</option>
                </select>

                <label>Choose Your Toppings</label>
                  <ul class="toppings-list">
                    <li class="topping">
                      <input type="checkbox" id="pepperoni" name="toppings" value="Pepperoni">
                      <label for="pepperoni">
                        <img src="assets/img/toppings/pepperoni.png" alt="Pepperoni">
                        Pepperoni
                      </label>
                    </li>
                    <li class="topping">
                      <input type="checkbox" id="mushrooms" name="toppings" value="Mushrooms">
                      <label for="mushrooms">
                        <img src="assets/img/toppings/mushroom.webp" alt="Mushrooms">
                        Mushrooms
                      </label>
                    </li>
                    <li class="topping">
                      <input type="checkbox" id="fresh-onions" name="toppings" value="Fresh onions">
                      <label for="fresh-onions">
                        <img src="assets/img/toppings/fresh onion.webp" alt="Onions">
                        Fresh Onions
                      </label>
                    </li>
                    <li class="topping">
                      <input type="checkbox" id="purple-onions" name="toppings" value="Purple onions">
                      <label for="purple-onions">
                        <img src="assets/img/toppings/purple onion.webp" alt="Onions">
                        Purple Onions
                      </label>
                    </li>
                    <li class="topping">
                      <input type="checkbox" id="green-olives" name="toppings" value="Green olives">
                      <label for="green-olives">
                        <img src="assets/img/toppings/green olives.webp" alt="Olives">
                        Green Olives
                      </label>
                    </li>
                    <li class="topping">
                      <input type="checkbox" id="black-olives" name="toppings" value="Black olives">
                      <label for="black-olives">
                        <img src="assets/img/toppings/black olives.webp" alt="Olives">
                        Black Olives
                      </label>
                    </li>
                    <li class="topping">
                      <input type="checkbox" id="jalapeno" name="toppings" value="Jalapeno">
                      <label for="jalapeno">
                        <img src="assets/img/toppings/jalapeno.webp" alt="Jalapeño">
                        Jalapeño
                      </label>
                    </li>
                    <li class="topping">
                      <input type="checkbox" id="garlic" name="toppings" value="Garlic">
                      <label for="garlic">
                        <img src="assets/img/toppings/garlic.webp" alt="Garlic">
                        Crushed Garlic
                      </label>
                    </li>
                   <li class="topping">
                      <input type="checkbox" id="corn" name="toppings" value="Corn">
                      <label for="corn">
                        <img src="assets/img/toppings/corn.webp" alt="Corn">
                        Corn
                      </label>
                    </li>
                    <li class="topping">
                      <input type="checkbox" id="cheddar" name="toppings" value="Cheddar">
                      <label for="cheddar">
                        <img src="assets/img/toppings/cheddar.webp" alt="Cheddar">
                        Cheddar
                      </label>
                    </li>
                    <li class="topping">
                      <input type="checkbox" id="tomato" name="toppings" value="Tomato">
                      <label for="tomato">
                        <img src="assets/img/toppings/tomato.webp" alt="Tomato">
                        Tomato
                      </label>
                    </li>
                    <li class="topping">
                      <input type="checkbox" id="pepper" name="toppings" value="Pepper">
                      <label for="pepper">
                        <img src="assets/img/toppings/read peaper.webp" alt="pepper">
                        Bell Pepper
                      </label>
                    </li>
                    <li class="topping">
                      <input type="checkbox" id="pineapple" name="toppings" value="Pineapple">
                      <label for="pineapple">
                        <img src="assets/img/toppings/pineapple.webp" alt="Pineapple">
                        Pineapple
                      </label>
                    </li>
                </ul>

                <label for="quantity">Quantity:</label>
                <input type="number" name="quantity" id="quantity" min="1" value="1" required />

                <label>Select Delivery Method:</label>
                <div class="delivery-methods">
                    <input type="radio" name="deliveryMethod" value="Pickup" id="pickup" required />
                    <label class="delivery-option" for="pickup" id="pickup-option">
                        <div class="option-content">
                            <img src="assets/img/pickup.png" alt="Pickup" class="option-image"/>
                            <h3>Pickup</h3>
                            <p>Pickup from our restaurant</p>
                        </div>
                    </label>
    
                    <input type="radio" name="deliveryMethod" value="Delivery" id="delivery" required />
                    <label class="delivery-option" for="delivery" id="delivery-option">
                        <div class="option-content">
                            <img src="assets/img/delivery.png" alt="Delivery" class="option-image"/>
                            <h3>Delivery</h3>
                            <p>We deliver to your address</p>
                        </div>
                    </label>
                </div>  

                <div id="addressField" style="display:none;">
                    <label for="address">Delivery Address:</label>
                    <input type="text" id="address" name="address"/>
                </div>

                <label for="payment">Payment Method:</label>
                <select name="payment" required>
                    <option value="Credit Card">💳 Credit Card</option>
                    <option value="Cash">💵 Cash</option>
                    <option value="Mobile Payment">📱 Mobile Payment</option>
                </select>
                <div class="button-wrapper">
                    <button type="submit" name="submit">Place Order</button>
                </div>
            </form>
        </div>
       <div id="popupOverlay" class="popup-overlay">
            <div id="popupContent" class="popup-content">
                <h3 id="popupTitle" class="popup-title">Title</h3>
                <p id="popupMessage" class="popup-message">Message</p>
                <button id="popupButton" class="popup-button" onclick="closePopup()">OK</button>
            </div>
        </div>
    <script type="text/javascript">
            document.querySelectorAll('input[name="deliveryMethod"]').forEach((elem) => {
                elem.addEventListener("change", function (event) {
                    var addressField = document.getElementById("addressField");
                    if (event.target.value === "Delivery") {
                        addressField.style.display = "block";
                    } else {
                        addressField.style.display = "none";
                    }
                });
            });

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
    <% } %>
</asp:Content>

