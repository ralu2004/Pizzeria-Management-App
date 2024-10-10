<?php
// Database connection information
$serverName = "PC_ADAMRaluca\SQLEXPRESS"; // Server name or IP address
$connection = array(
    "Database" => "Pizzarestaurant",  // Your database name
    "Uid" => " ",            // Your SQL Server username
    "PWD" => " "             // Your SQL Server password
);

// Establish the connection to SQL Server
$conn = sqlsrv_connect($serverName, $connection);

// Check if the connection was successful
if ($conn === false) {
    echo"Err". sqlsrv_errors() ."";
    die(print_r(sqlsrv_errors(), true));
}
?>
