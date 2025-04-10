<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="gallery-page">
        <h1 class="heading">Pizza Gallery</h1>
        <p class="description">Discover our delicious creations, each crafted to perfection.</p>

        <div class="gallery-grid">
            <div class="gallery-item">
                <img src="assets/img/pizzas/margherita.jfif" class="gallery-img"/>
                <h3>Margherita</h3>
                <p>Classic Italian pizza with fresh mozzarella, basil, and our signature tomato sauce.</p>
            </div>
            <div class="gallery-item">
                <img src="assets/img/pizzas/pepperoni.jfif" class="gallery-img"/>
                <h3>Pepperoni</h3>
                <p>A timeless favorite with generous slices of pepperoni and melty cheese.</p>
            </div>
            <div class="gallery-item">
                <img src="assets/img/pizzas/veggie supreme.jpg" class="gallery-img"/>
                <h3>Veggie Supreme</h3>
                <p>Loaded with fresh veggies, including bell peppers, olives, and mushrooms.</p>
            </div>
            <div class="gallery-item">
                <img src="assets/img/pizzas/bbq chicken.jpg" class="gallery-img"/>
                <h3>BBQ Chicken</h3>
                <p>Tender chicken, tangy BBQ sauce, and a blend of melted cheeses.</p>
            </div>
            <div class="gallery-item">
                <img src="assets/img/pizzas/four cheese.jpg" class="gallery-img"/>
                <h3>Four Cheese</h3>
                <p>A creamy combination of mozzarella, parmesan, gorgonzola, and cheddar.</p>
            </div>
            <div class="gallery-item">
                <img src="assets/img/pizzas/hawaiian.jpg" class="gallery-img"/>
                <h3>Hawaiian</h3>
                <p>Sweet and savory with pineapple, ham, and our delicious tomato base.</p>
            </div>
        </div>
    </div>
</asp:Content>