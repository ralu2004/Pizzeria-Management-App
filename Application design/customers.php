<?php
include("database.php");
include("functions.php");

$message = '';  
$messageType = '';  

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $firstname = htmlspecialchars(trim($_POST['fname']));
    $lastname = htmlspecialchars(trim($_POST['lname']));

    $customerID = -1;  

    $sqlFind = "{CALL FindCustomer(?, ?, ?)}";
    $paramsFind = array(
        array($firstname, SQLSRV_PARAM_IN),
        array($lastname, SQLSRV_PARAM_IN),
        array(&$customerID, SQLSRV_PARAM_OUT)
    );

    $stmtFind = sqlsrv_query($conn, $sqlFind, $paramsFind);

    if ($stmtFind === false) {
        die(print_r(sqlsrv_errors(), true));
    }

    if (isset($_POST["add"]) && $_POST["add"] == "Add Customer") {
        if ($customerID > 0) {
            $message = "Customer already exists!";
            $messageType = "error";
        } else {
            $sqlAdd = "{CALL NewCustomer(?, ?)}";
            $paramsAdd = array(
                array($firstname, SQLSRV_PARAM_IN),
                array($lastname, SQLSRV_PARAM_IN)
            );

            $stmtAdd = sqlsrv_query($conn, $sqlAdd, $paramsAdd);

            if ($stmtAdd === false) {
                die(print_r(sqlsrv_errors(), true));
            }

            $message = "Customer added successfully!";
            $messageType = "success";
        }
    } elseif (isset($_POST["delete"]) && $_POST["delete"] == "Delete Customer") {
        
        $sqlDelete = "{CALL DeleteCustomer(?, ?)}";
        $paramsDelete = array(
            array($firstname, SQLSRV_PARAM_IN),
            array($lastname, SQLSRV_PARAM_IN)
        );
        $stmtDelete = sqlsrv_query($conn, $sqlDelete, $paramsDelete);
        if ($stmtDelete === false) {
            die(print_r(sqlsrv_errors(), true));
        }
        $message = "Customer deleted successfully!";
        $messageType = "success";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src='scripts.js'></script>
    <title>PizzaRestaurantManagement - Customers</title>
</head>
<body>
    <header>
        <h2>Customers</h2>
    </header>

    <?php include 'navbar.php'; ?>

    <main>
        <div>
            <h3>Manage customers:</h3>
            <p>Add a new customer or delete an old one. Enter their data then select the desired option!</p>
            <form action='<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>' method="POST" id="homeform">
                <label>First Name:</label><br>
                <input id="box" type="text" name="fname" required>*<br>

                <label>Last Name:</label><br>
                <input id="box" type="text" name="lname" required>*<br>

                <input id="i1" type="submit" name="add" value="Add Customer"><br>
                <input id="i1" type="submit" name="delete" value="Delete Customer"><br>
            </form>

            <?php displayMessage($message, $messageType); ?>
        </div>
    </main>

    <?php include 'footer.php'; ?>
</body>
</html>
