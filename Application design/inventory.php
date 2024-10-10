<?php
include("database.php");
include("functions.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="scripts.js"></script>
    <title>PizzaRestaurantManagement - Home</title>
</head>
<body>
    <header>
        <h2>Inventory</h2>
    </header>

    <?php include 'navbar.php'; ?>

    <main>
        <!-- Tab navigation -->
        <div class="tab">
            <button class="tablinks active" onclick="openTab(event, 'stock1')">Stock by Item</button>
            <button class="tablinks" onclick="openTab(event, 'stock2')">Stock by Ingredient</button>
        </div>

        <!-- Tab content for Stock by Item -->
        <div id="stock1" class="tabcontent active">
            <h3>Stock by Item</h3>
            <?php
                $sql = 'SELECT * FROM Stock1';
                $result = sqlsrv_query($conn, $sql);
                if ($result === false || !sqlsrv_has_rows($result)) {
                    echo "<p>No data available in Stock1 table.</p>";
                } else {
                    displayStockByItem($conn, $sql);
                }
            ?>
        </div>

        <!-- Tab content for Stock by Ingredient -->
        <div id="stock2" class="tabcontent">
            <h3>Stock by Ingredient</h3>
            <?php
                $sql = 'SELECT * FROM Stock2';
                $result = sqlsrv_query($conn, $sql);
                if ($result === false || !sqlsrv_has_rows($result)) {
                    echo "<p>No data available in Stock2 table.</p>";
                } else {
                    displayStockByIngredient($conn, $sql);
                }
            ?>
        </div>
    </main>

    <?php include 'footer.php'; ?>

    <?php
    // Close the connection
    sqlsrv_close($conn);
    ?>
</body>
</html>
