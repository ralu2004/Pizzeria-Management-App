<?php
include 'database.php';
include 'functions.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src='scripts.js'></script>
    <title>PizzaRestaurantManagement - Home</title>
</head>

<body>
    <header>
        <h2>Home</h2>
    </header>

    <?php include 'navbar.php'; ?>

    <main>
        <h1>Welcome!</h1>
        <p>
            Welcome to Pizza Restaurant Management, your ultimate solution for managing pizza orders and deliveries efficiently!
            Our system is designed to streamline every aspect of your pizza business, from tracking customer orders,
            managing inventory, and staff, to maintaining your menu and recipes. Whether you're a
            single pizzeria or managing multiple outlets, we make sure your operations are smooth and hassle-free.
        </p>
        <p>
            This system allows you to handle:
        <ul>
            <li><strong>Customers:</strong> Manage you customer data.</li>
            <li><strong>Orders:</strong>Enter new orders, view order activity and reports, update status.</li>
            <li><strong>Staff management:</strong> Add new empoyees, manage work shifts.</li>
            <li><strong>Inventory Control:</strong> Track stock levels and prevent shortages with real-time updates.</li>
            <li><strong>Recipe Management:</strong> Keep all your recipes in one place to easily access and use them.</li>
        </ul>
        </p>
    </main>

    <?php include 'footer.php'; ?>
</body>

</html>