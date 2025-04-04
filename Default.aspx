<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="default">
        <div class="hero">
            <h1 class="heading">Pizza Moshiko🍕</h1>
            <p>Where every slice tells a story of passion, freshness, and tradition.</p>
        </div>
        <div class="cta">
            <h2>Ready to Order?</h2>
            <p>Get your favorite pizza delivered right to your door in no time. Order now and enjoy!</p>
            <a href="Order.aspx" class="order-now-btn">Order Now</a>
        </div>
        <div class="feet">
            <div class="feature-row">
                <div class="feature-box">
                    <h3>Menu Variety and Customization</h3>
                    <p>Choose from a wide range of pizza styles and create your perfect pizza with customizable toppings, crusts, and sauces.</p>
                </div>
                <div class="feature-box">
                    <h3>Ordering Convenience</h3>
                    <p>Easily order online for delivery or pickup through our website or mobile app for quick service.</p>
                </div>
                <div class="feature-box">
                    <h3>Quality of Food</h3>
                    <p>Enjoy fresh, high-quality ingredients in every pizza, made with care and passion for flavor.</p>
                </div>
            </div>
            <div class="feature-row">
                <div class="feature-box">
                    <h3>Customer Service</h3>
                    <p>Our friendly and attentive staff ensure a smooth and pleasant experience from start to finish.</p>
                </div>
                <div class="feature-box">
                    <h3>Payment Methods and Ease</h3>
                    <p>We accept a variety of payment options, including credit cards, mobile payments, and contactless options for your convenience.</p>
                </div>
                <div class="feature-box">
                    <h3>Event Hosting</h3>
                    <p>We provide space for parties and gatherings with catering services, making every event memorable.</p>
                </div>
            </div>
        </div>
        <div class="special-offers">
            <h2>Special Offers</h2>
            <div class="offer-box">
                <h3>Buy 1 Get 1 Free</h3>
                <p>Enjoy a free pizza with the purchase of any pizza. Limited time only!</p>
            </div>
            <div class="offer-box">
                <h3>20% Off Your First Order</h3>
                <p>Get 20% off when you order for the first time. Use code: JAMUS25</p>
            </div>
        </div>
        <div class="testimonials">
            <h2>What Our Customers Say</h2>
            <div class="testimonial">
                <p>"Best pizza I've ever had! The crust was perfect, and the toppings were fresh. Highly recommend!"</p>
                <span>- Erez O.</span>
            </div>
            <div class="testimonial">
                <p>"A great experience from ordering to delivery - they deliverd it all the way to canda in 30 minutes! The pizza was hot and delicious. Will order again!"</p>
                <span>- Matan Y.</span>
            </div>
        </div>
        <div class="location">
            <div class="location-text">
                <h2>Find Us Here</h2>
                <p>Zikhron Ya'akov St 10, Petah Tikva, Israel</p>
            </div>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6759.502661247903!2d34.8736739097599!3d32.10300577384388!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x151d363da78b2021%3A0xda1f292df6742176!2sZikhron%20Ya&#39;akov%20St%2010%2C%20Petah%20Tikva%2C%20Israel!5e0!3m2!1sen!2sus!4v1734819773101!5m2!1sen!2sus" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>
</asp:Content>

