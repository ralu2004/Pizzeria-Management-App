<?php
include 'database.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and capture the form data
    $firstname =  htmlspecialchars(trim($_POST['fname']));
    $lastname =  htmlspecialchars(trim($_POST['lname']));
    $customerID = -1;

    $sql = "{CALL FindCustomer(?, ?, ?)}";

    $params = array(
        array($firstname, SQLSRV_PARAM_IN),
        array($lastname, SQLSRV_PARAM_IN),
        array(&$customerID, SQLSRV_PARAM_OUT)
    );

    $stmt = sqlsrv_query($conn, $sql, $params);

    if ($stmt === false) {
        die(print_r(sqlsrv_errors(), true));
    }

    sqlsrv_free_stmt($stmt);

    if ($customerID > 0) {
        echo "Customer ID: " . $customerID;
        $item = htmlspecialchars(trim($_POST['item']));
        $quantity = $_POST['quantity'];
        $address1 = htmlspecialchars(trim($_POST['address1']));
        $address2 = htmlspecialchars(trim($_POST['address2']));
        $city = htmlspecialchars(trim($_POST['city']));
        $zipcode = htmlspecialchars(trim($_POST['zipcode']));

        $sql1 = '{CALL PlaceOrder(?, ?, ?, ?, ?, ?, ?)}';

        $params1 = array(
            array($item, SQLSRV_PARAM_IN),
            array($quantity, SQLSRV_PARAM_IN),
            array($customerID, SQLSRV_PARAM_IN),
            array($address1, SQLSRV_PARAM_IN),
            array($address2, SQLSRV_PARAM_IN),
            array($city, SQLSRV_PARAM_IN),
            array($zipcode, SQLSRV_PARAM_IN)
        );

        $stmt1 = sqlsrv_query($conn, $sql1, $params1);

        if ($stmt1 === false) {
            die(print_r(sqlsrv_errors(), true));
        } else {
            $message = "Order placed successfully!";
            $messageType = "success";
        }
        sqlsrv_free_stmt($stmt1);
    } else {
        $message = "Customer not found or error in input. Please make sure you are entering the name of a valid customer!";
        $messageType = "error";
    }
    sqlsrv_close($conn);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src='scripts.js'></script>
    <title>Place New Order</title>

</head>

<body>
    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST" class="neworderform">
        <h3>New Order</h3>
        <p>Please provide all the required data below:</p><br>
        <label>Customer First Name:</label><br>
        <input id="box" type="text" name="fname" required>*<br>

        <label>Customer Last Name:</label><br>
        <input id="box" type="text" name="lname" required>*<br>

        <label>Item:</label><br>
        <input id="box" type="text" name="item" required>*<br>

        <label>Quantity:</label><br>
        <input id="box" type="int" name="quantity" required>*<br>

        <label>Address:</label><br>
        <input id="box" type="text" name="address1" required>*<br>

        <label>Address details:</label><br>
        <input id="box" type="text" name="address2"><br>

        <label>City:</label><br>
        <input id="box" type="text" name="city" required>*<br>

        <label>Zipcode:</label><br>
        <input id="box" type="text" name="zipcode" required>*<br>

        <input id="i1" type="submit" name="submit" value="Submit"><br>
    </form>

    <?php displayMessage($message, $messageType) ?>
    </div>
</body>

</html>