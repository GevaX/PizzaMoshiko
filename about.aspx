<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="about-slogan">
        <div style="margin-right: 50px;">
            <blockquote class="slogan-text">
                <span class="quote-mark start">“</span>
                In crust we trust
                <span class="quote-mark end">”</span>
            </blockquote>
            <p class="slogan-description">
                Our passion for perfect crusts and our unwavering belief in authentic flavors inspire everything we do. Welcome to a place where every slice tells a story of passion, freshness, and tradition.
            </p>
        </div>
        <img src="assets/img/store-front.png" />
    </div>
    <section class="our-story">
        <h2>Our story</h2>
        <div>
            <p>
                Moshiko’s journey began in a small village nestled on the outskirts of Petah Tikva, where the aroma of fresh bread baking in the family oven filled his childhood home. 
                As a young boy, Moshiko spent countless hours in the kitchen, watching his grandmother knead dough with care and precision. She would often share stories of their family’s culinary heritage, 
                passed down through generations. It was during these formative years that Moshiko discovered his love for the art of cooking, a passion that would eventually lead him to pizza.
            </p>
            <img src="assets/img/os1.png" />
        </div>
        <div>
            <p>
                As a teenager, Moshiko took his first job at a neighborhood pizzeria. 
                While others viewed it as just a summer gig, he immersed himself in every aspect of pizza-making, 
                from crafting the perfect dough to experimenting with sauces. 
                It was here that he realized pizza wasn’t just food—it was a canvas for creativity. 
                His dedication and curiosity set him apart, earning him the nickname “Little Maestro” among his coworkers.
            </p>
            <img src="assets/img/os2.png" />
        </div>
        <div>
            <p>
                In his early twenties, Moshiko took a bold leap of faith, 
                traveling to Naples, Italy—the birthplace of pizza. 
                There, he trained under master pizzaiolos, learning the secrets of authentic Neapolitan pizza. 
                Long nights spent perfecting the delicate balance between a crisp crust and a tender center became his new normal. 
                Yet, Moshiko didn’t just learn; he absorbed the passion and philosophy of Italian pizza-making, 
                which emphasized love and respect for the ingredients.
            </p>
            <img src="assets/img/os3.png" />
        </div>
        <div>
            <p>
                When Moshiko returned to Petah Tikva, he was determined to share his vision of what pizza could be. 
                In 2010, he opened Pizza Moshiko, starting with a small wood-fired oven and a handful of recipes inspired by his travels and childhood memories. 
                Word quickly spread about his pizzas, which combined the authenticity of Naples with a local twist. 
                The restaurant became a gathering spot for friends, families, and food lovers.
            </p>
            <img src="assets/img/os4.png" />
        </div>
        <div style="justify-content: center; align-content: center;">
            <p style="font-style: italic;">
                Over the years, Pizza Moshiko has grown, but the heart of the business remains the same: 
                a dedication to quality, community, and innovation. Each pizza tells a story of hard work, tradition, 
                and the pursuit of excellence. Moshiko’s dream of creating a place where people can come together over a 
                perfect slice has become a reality, and it all started with a boy in a village, inspired by the aroma of his grandmother’s kitchen.
            </p>
        </div>
    </section>
    <section class="our-philosophy">
        <div>
            <h2>Our Philosophy</h2>
            <p>
                We live by the motto “In Crust We Trust,” and it shows in every pizza we make.
                Whether it’s the perfect stretch of our mozzarella, the tangy zest of our tomato sauce, 
                or the delightful crunch of our hand-tossed crust, 
                every element is crafted with care and precision. 
                We believe in delivering not just a meal, but an experience that ignites your senses and warms your heart.
            </p>
        </div>
        <img src="assets/img/in-crust-we-trust.png" />
    </section>
    <section class="what-apart">
        <h2>What Sets Us Apart</h2>
        <div class="pillar-container">
            <div class="pillar">
                <div class="plaque">
                    <h3>I</h3>
                    <p><b>Freshness Guaranteed</b>: From the first bite to the last, our pizzas are made from scratch daily, using only the freshest ingredients.</p>
                </div>
                <img src="assets/img/pillar.png" />
            </div>
            <div class="pillar">
                <div class="plaque">
                    <h3>II</h3>
                    <p><b>Community First</b>: We’re proud to be a part of Petah Tikva, supporting local suppliers and hosting events that bring our neighborhood together.</p>
                </div>
                <img src="assets/img/pillar.png" />
            </div>
            <div class="pillar">
                <div class="plaque">
                    <h3>III</h3>
                    <p><b>Innovation with Tradition</b>: While we honor the timeless art of pizza-making, we also love to experiment with bold flavors and creative toppings, ensuring there’s something for everyone to enjoy.</p>
                </div>
                <img src="assets/img/pillar.png" />
            </div>
        </div>
    </section>
    <section class="team">
        <h2>Meet the Team</h2>
        <p>
            At Pizza Moshiko, our team is the heart and soul of everything we do. 
            Each member brings their unique passion and expertise, working together to create an unforgettable pizza experience for you.
        </p>
        <div class="team-grid">
            <!-- Moshiko -->
            <div class="team-member">
                <img src="assets/img/moshiko.png" alt="Moshiko - Founder & Master Pizzaiolo" class="team-photo">
                <h3 class="team-name">Moshiko</h3>
                <p class="team-title">Founder & Master Pizzaiolo</p>
                <p class="team-description">The heart and soul of Pizza Moshiko, Moshiko brings his passion and expertise to every pizza, ensuring each slice is a masterpiece.</p>
            </div>
            <!-- Shlomi -->
            <div class="team-member">
                <img src="assets/img/shlomi.png" alt="Shlomi - Dough Whisperer" class="team-photo">
                <h3 class="team-name">Shlomi</h3>
                <p class="team-title">Dough Whisperer</p>
                <p class="team-description">Shlomi’s precise technique ensures every pizza starts with a perfect foundation. His energy keeps the kitchen buzzing.</p>
            </div>
            <!-- Amir -->
            <div class="team-member">
                <img src="assets/img/amir.png" alt="Amir - Delivery Dynamo" class="team-photo">
                <h3 class="team-name">Amir</h3>
                <p class="team-title">Delivery Dynamo</p>
                <p class="team-description">Amir makes sure your pizza arrives hot and fresh. His dedication and speed make him a local legend.</p>
            </div>
        </div>
    </section>
</asp:Content>

