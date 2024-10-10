<?php
include("database.php");
include("functions.php");

// Fetch current and next shifts from the database
list($currentShift, $nextShift) = GetCurrentShift($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src='scripts.js'></script>
    <title>PizzaRestaurantManagement - Staff</title>
</head>
<body>
    <header>
        <h2>Staff</h2>
    </header>

    <?php include 'navbar.php'; ?>

    <main>
        <div class="tab">
            <button class="tablinks active" onclick="openTab(event, 'shifts')">Shifts</button>
            <button class="tablinks" onclick="openTab(event, 'activity')">View Staff Activity</button>
            <button class="tablinks" onclick="openTab(event, 'addStaff')">Add Staff</button>
            <button class="tablinks" onclick="openTab(event, 'deleteStaff')">Delete Staff</button>
        </div>

        <div id="shifts" class="tabcontent active">
            <h3>Current and Next Shift</h3>
            <?php 
            // Display current and next shifts using functions
            displayShift($currentShift, 'current');
            displayShift($nextShift, 'next'); 
            ?>
        </div>

        <div id="activity" class="tabcontent">
            <h3>Staff Activity</h3>
            <?php 
                $sql = "SELECT * FROM dbo.StaffActivity";
                ViewStaffActivity($conn, $sql);
            ?>
        </div>

        <div id="addStaff" class="tabcontent">
            <?php include 'addstaff.php'; ?>
        </div>

        <div id="deleteStaff" class="tabcontent">
            <?php include 'delstaff.php'; ?>
        </div>
    </main>

    <?php include 'footer.php'; ?>
</body>
</html>
