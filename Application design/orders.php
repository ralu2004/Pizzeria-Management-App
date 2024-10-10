<?php
include 'database.php'; // Database connection file
include 'functions.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src='scripts.js'></script>
    <title>PizzaRestaurantManagement - Orders</title>
</head>
<body>
    <header>
        <h2>Orders</h2>
    </header>

    <?php include 'navbar.php'; ?>

    <main>
        <div class="tab">
            <button class="tablinks active" onclick="openTab(event, 'orderActivity')">Order Activity</button>
            <button class="tablinks" onclick="openTab(event, 'newOrder')">New Order</button>
            <button class="tablinks" onclick="openTab(event, 'updateStatus')">Update Order Status</button>
            <button class="tablinks" onclick="openTab(event, 'pastWeek')">Orders Past Week</button>
            <button class="tablinks" onclick="openTab(event, 'pendingOrders')">Pending Orders</button> 
        </div>

        <div id="orderActivity" class="tabcontent active">
            <h3>Order Activity</h3>
            <?php
            $sql = "SELECT * FROM OrderActivity";
            displayOrders($conn, $sql); 
            sqlsrv_close($conn); 
            ?>
        </div>

        <div id="newOrder" class="tabcontent">
            <?php include 'neworder.php'; ?>
        </div>

        <div id="updateStatus" class="tabcontent">
            <?php include 'updateorderstatus.php'; ?>
        </div>

        <div id="pastWeek" class="tabcontent">
            <h3>Orders Past Week</h3>
            <?php
            $sql = "{Call GetOrdersPastWeek()}";
            displayOrders($conn, $sql); 
            ?>
        </div>

        <div id="pendingOrders" class="tabcontent"> 
            <h3>Pending Orders</h3>
            <?php
            $sql = "{Call FindPendingOrders()}";
            displayOrders($conn, $sql);
            sqlsrv_close($conn);
            ?>
        </div>
    </main>

    <?php include 'footer.php'; ?>
</body>
</html>
