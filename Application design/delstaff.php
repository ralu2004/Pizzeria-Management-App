<?php
include 'database.php';

$message = ''; // Variable to store success or error messages

// Function to delete staff member
function deleteStaff($conn, $firstName, $lastName) {
    $sql = '{CALL DeleteStaffByName(?, ?)}';

    // Parameters to be passed to the stored procedure
    $params = array(
        array($firstName, SQLSRV_PARAM_IN),
        array($lastName, SQLSRV_PARAM_IN),
    );

    $stmt = sqlsrv_query($conn, $sql, $params);

    if ($stmt === false) {
        return false; // Return false on error
    }

    sqlsrv_free_stmt($stmt); // Free the statement resource
    return true; // Return true on success
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and capture the form data
    $firstName = htmlspecialchars(trim($_POST['fname']));
    $lastName = htmlspecialchars(trim($_POST['lname']));

    // Call the function to delete staff
    if (deleteStaff($conn, $firstName, $lastName)) {
        $message = "Staff member deleted successfully!";
    } else {
        $message = "Error deleting staff member. Please try again.";
    }

    // Redirect to the same page to avoid form resubmission
    header("Location: " . $_SERVER['PHP_SELF']);
    exit(); // Terminate the script after redirection
}

sqlsrv_close($conn); // Close the database connection
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Delete Staff</title>
</head>
<body>
    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST" class="staffform">
        <h3>Delete Staff</h3>
        <?php if (!empty($message)) : ?>
            <p style="color: <?= strpos($message, 'Error') !== false ? 'red' : 'green'; ?>;">
                <?= $message; ?>
            </p>
        <?php endif; ?>
        <p>Please provide all the required data below:</p><br>
        <label>First Name:</label><br>
        <input id="box" type="text" name="fname" required>*<br>

        <label>Last Name:</label><br>
        <input id="box" type="text" name="lname" required>*<br>

        <input id="i1" type="submit" name="submit" value="Delete"><br>
    </form>
</body>
</html>
