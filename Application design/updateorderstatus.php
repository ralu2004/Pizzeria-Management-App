<?php
include 'database.php'; // Link the database connection file

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and capture the form data
    $order = htmlspecialchars(trim($_POST['order']));
    $status = (int)htmlspecialchars(trim($_POST['status']));

    $sql = '{CALL UpdateOrderStatus(?, ?)}'; 

    // Parameters to be passed to the stored procedure
    $params = array(
        array($order, SQLSRV_PARAM_IN),    
        array($status, SQLSRV_PARAM_IN), 
    );

    // Execute the stored procedure
    $stmt = sqlsrv_query($conn, $sql, $params);

    // Check for execution errors
    if ($stmt === false) {
        die(print_r(sqlsrv_errors(), true));
    } else {
        $message = "Order status updated successfully!";
        $messageType = "success";
    }

    // Free the statement and close the connection
    sqlsrv_free_stmt($stmt);
    sqlsrv_close($conn);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src = 'scripts.js'></script>
    <title>Update Order Status</title>
</head>
<body>
    <div class="popup">
        <span class="close" onclick="closePopup()">X</span>
        <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST" class="neworderform">
            <h3>Update Status</h3>
            <p>Please provide all the required data below:</p><br>

            <label for="box">Order Id:</label><br>
            <input id="box" type="text" name="order" required>*<br>
            
            <input type="radio" name="status" value="1" required>Mark as delivered<br> 
            <input id="i1" type="submit" name="submit" value="Submit"><br>
        </form>
        <!-- Error or Success Messages -->
        <?php if ($message): ?>
            <p style="color: <?= $messageType == 'error' ? 'red' : 'green' ?>;">
                <?= $message; ?>
            </p>
        <?php endif; ?>
    </div>
</body>
</html>
