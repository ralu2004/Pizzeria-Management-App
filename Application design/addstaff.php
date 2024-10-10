<?php
include 'database.php';

$message = ''; // Initialize a message variable to show success or error messages

// Function to add a new staff member
function addNewStaff($conn, $firstName, $lastName, $position, $hireDate, $hourlyRate, $email) {
    $sql = '{CALL AddNewStaff(?, ?, ?, ?, ?, ?)}';

    // Parameters to be passed to the stored procedure
    $params = array(
        array($firstName, SQLSRV_PARAM_IN),
        array($lastName, SQLSRV_PARAM_IN),
        array($position, SQLSRV_PARAM_IN),
        array($hireDate, SQLSRV_PARAM_IN),
        array($hourlyRate, SQLSRV_PARAM_IN),
        array($email, SQLSRV_PARAM_IN)
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
    $position = htmlspecialchars(trim($_POST['position']));
    $hireDate = $_POST['hiredate']; 
    $hourlyRate = number_format((float)$_POST['hourlyrate'], 2, '.', ''); 
    $email = htmlspecialchars(trim($_POST['email']));

    // Call the function to add new staff
    if (addNewStaff($conn, $firstName, $lastName, $position, $hireDate, $hourlyRate, $email)) {
        $message = "New staff member added successfully!";
        
        // Redirect to the same page to avoid form resubmission
        header("Location: " . $_SERVER['PHP_SELF']);
        exit(); // Terminate the script after redirection
    } else {
        $message = "Error adding staff member. Please try again.";
    }

    sqlsrv_close($conn); // Close the database connection
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Add New Staff Member</title>
</head>
<body>
    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST" class="addstaffform">
        <h3>Add New Staff Member</h3>
        <?php if (!empty($message)) : ?>
            <p style="color: <?= strpos($message, 'Error') !== false ? 'red' : 'green'; ?>;">
                <?= $message; ?>
            </p>
        <?php endif; ?>
        <p>Please provide all the required data below:</p><br>
        <label>First Name:</label><br>
        <input id="box" type="text" name="fname" value="<?php echo isset($firstName) ? htmlspecialchars($firstName) : ''; ?>" required>*<br>

        <label>Last Name:</label><br>
        <input id="box" type="text" name="lname" value="<?php echo isset($lastName) ? htmlspecialchars($lastName) : ''; ?>" required>*<br>

        <label>Position:</label><br>
        <input id="box" type="text" name="position" value="<?php echo isset($position) ? htmlspecialchars($position) : ''; ?>" required>*<br>

        <label>Hire Date (current date):</label><br>
        <input id="box" type="date" name="hiredate" value="<?php echo isset($hireDate) ? htmlspecialchars($hireDate) : ''; ?>" required>*<br>

        <label>Hourly Rate:</label><br>
        <input id="box" type="text" name="hourlyrate" value="<?php echo isset($hourlyRate) ? htmlspecialchars($hourlyRate) : ''; ?>" required>*<br>

        <label>E-mail:</label><br>
        <input id="box" type="email" name="email" value="<?php echo isset($email) ? htmlspecialchars($email) : ''; ?>" required>*<br>

        <input id="i1" type="submit" name="submit" value="Register"><br>
    </form>
</body>
</html>
