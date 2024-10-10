<?php
/**
 * Fetches and displays pending orders from the database.
 *
 * @param resource $conn Database connection resource.
 * @return void Outputs an HTML table of pending orders.
 */
function displayOrders($conn, $sql) {

    $query = sqlsrv_query($conn, $sql);

    if ($query === false) {
        die(print_r(sqlsrv_errors(), true));
    }

    echo '<table border=1>';
    echo '<tr>
            <th>ID</th>
            <th>Item Price</th>
            <th>Quantity</th>
            <th>Item Name</th>
            <th>Created At</th>
            <th>Delivery Address1</th>
            <th>Delivery Address2</th>
            <th>Delivery City</th>
            <th>Zipcode</th>
            <th>Delivery</th>
          </tr>';

    if (sqlsrv_has_rows($query)) {
        while ($row = sqlsrv_fetch_array($query, SQLSRV_FETCH_ASSOC)) {
            $createdAt = $row['CreatedAt'] instanceof DateTime ? $row['CreatedAt']->format('Y-m-d H:i:s') : $row['CreatedAt'];
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['OrderID']) . "</td>";
            echo "<td>" . htmlspecialchars($row['ItemPrice']) . "</td>";
            echo "<td>" . htmlspecialchars($row['Quantity']) . "</td>";
            echo "<td>" . htmlspecialchars($row['ItemName']) . "</td>";
            echo "<td>" . htmlspecialchars($createdAt) . "</td>";
            echo "<td>" . htmlspecialchars($row['DeliveryAddress1']) . "</td>";
            echo "<td>" . htmlspecialchars($row['DeliveryAddress2']) . "</td>";
            echo "<td>" . htmlspecialchars($row['DeliveryCity']) . "</td>";
            echo "<td>" . htmlspecialchars($row['Zipcode']) . "</td>";
            echo "<td>" . htmlspecialchars($row['Delivery']) . "</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='10'>No records found</td></tr>";
    }
    echo '</table>';

    sqlsrv_free_stmt($query);
}

/**
 * Fetches and displays inventory from the database.
 *
 * @param resource $conn Database connection resource.
 * @return void Outputs an HTML table.
 */
function displayStockByItem($conn, $sql) {
    
    $query= sqlsrv_query($conn, $sql);

    if ($query === false) {
        die(print_r(sqlsrv_errors(), true));
    }

    echo '<table border=1>';
    echo '<tr>
            <th>Item</th>
            <th>Ingredient</th>
            <th>IngredientId</th>
            <th>Ingredient Weight</th>
            <th>Ingredient Price</th>
            <th>Ordered Quantity</th>
            <th>Recipe Quantity</th>
            <th>Weight</th>
            <th>Unit Cost</th>
            <th>Ingredient Cost</th>
          </tr>';

    if (sqlsrv_has_rows($query)) {
        while ($row = sqlsrv_fetch_array($query, SQLSRV_FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['ItemName']) . "</td>";
            echo "<td>" . htmlspecialchars($row['IngredientName']) . "</td>";
            echo "<td>" . htmlspecialchars($row['IngredientID']) . "</td>";
            echo "<td>" . number_format($row['IngredientWeight']) . "</td>"; 
            echo "<td>" . number_format($row['IngredientPrice'], 2) . "</td>";
            echo "<td>" . htmlspecialchars($row['OrderQuantity']) . "</td>";
            echo "<td>" . htmlspecialchars($row['RecipeQuantity']) . "</td>";
            echo "<td>" . number_format($row['OrderedWeight'], 2) . "</td>";
            echo "<td>" . number_format($row['UnitCost'], 2) . "</td>";
            echo "<td>" . number_format($row['IngredientCost'], 2) . "</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='10'>No records found</td></tr>";
    }
    echo '</table>';

    sqlsrv_free_stmt($query);
}

/**
 * Fetches and displays inventory from the database.
 *
 * @param resource $conn Database connection resource.
 * @return void Outputs an HTML table.
 */
function displayStockByIngredient($conn, $sql) {
    
    $query = sqlsrv_query($conn, $sql);
    if ($query === false) {
        die(print_r(sqlsrv_errors(), true));
    }

    echo '<table border=1>';
    echo '<tr>
            <th>Ingredient</th>
            <th>Ordered Quantity</th>
            <th>Total Inventory Quantity</th>
            <th>Remaining Weight</th>
          </tr>';

    if (sqlsrv_has_rows($query)) {
        while ($row = sqlsrv_fetch_array($query, SQLSRV_FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['IngredientName']) . "</td>";
            echo "<td>" . number_format($row['OrderedWeight'], 2) . "</td>";
            echo "<td>" . number_format($row['TotalInvWeight'], 2) . "</td>";
            echo "<td>" . number_format($row['RemainingWeight'], 2) . "</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='4'>No records found</td></tr>";
    }
    echo '</table>';

    sqlsrv_free_stmt($query);
}

/**
 * Fetches the current and next shifts from the database.
 *
 * @param resource $conn Database connection resource.
 * @return array An array containing the current and next shifts.
 */
function GetCurrentShift($conn) {
    $sql = "{ CALL GetCurrentShift }";
    $stmt = sqlsrv_query($conn, $sql);
    if ($stmt === false) {
        die(print_r(sqlsrv_errors(), true));
    }

    $currentShift = null;
    $nextShift = null;

    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
        if ($row['ShiftOrder'] == 1) {
            $currentShift = $row;
        } elseif ($row['ShiftOrder'] == 2) {
            $nextShift = $row;
        }
    }

    sqlsrv_free_stmt($stmt);
    
    return [$currentShift, $nextShift];
}

/**
 * Fetches and displays staff activity from the database.
 *
 * @param resource $conn Database connection resource.
 * @param resource $sql sql query to execute
 * @return void Outputs an HTML table.
 */
function ViewStaffActivity($conn, $sql) {
        $stmt = sqlsrv_query($conn, $sql);

        if ($stmt === false) {
            die(print_r(sqlsrv_errors(), true));
        }

        echo "<table border='1'>
                <tr>
                    <th>DayOfWeek</th>
                    <th>FirstName</th>
                    <th>LastName</th>
                    <th>HourlyRate</th>
                    <th>StartTime</th>
                    <th>EndTime</th>
                    <th>HoursInShift</th>
                    <th>StaffCost</th>
                </tr>";

                while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
                    echo "<tr>";
                    echo "<td>" . htmlspecialchars($row['DayOfWeek']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['FirstName']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['LastName']) . "</td>";
                    echo "<td>$" . number_format($row['HourlyRate'], 2) . "</td>";
                    $startTime = $row['StartTime'] ? $row['StartTime']->format('h:i A') : 'N/A';
                    $endTime = $row['EndTime'] ? $row['EndTime']->format('h:i A') : 'N/A';
                    echo "<td>" . htmlspecialchars($startTime) . "</td>";
                    echo "<td>" . htmlspecialchars($endTime) . "</td>";
                    echo "<td>" . number_format($row['HoursInShift'], 2) . "</td>";
                    echo "<td>$" . number_format($row['StaffCost'], 2) . "</td>"; 
                    echo "</tr>";
                }
        echo "</table>";
        sqlsrv_free_stmt($stmt);
}

 /**
 * Fetches and displays a shift from the database.
 *
 * @param resource $shift name of shift (current/next)
 * @return void Outputs an HTML table.
 */
function displayShift($shift, $shiftType) {
    if ($shift) {
        echo "<div class=\"{$shiftType}shift\">";
        echo "<h4>" . ucfirst($shiftType) . " Shift</h4>";
        echo "<p><strong>Rota ID:</strong> " . htmlspecialchars($shift['RotaID']) . "</p>";
        echo "<p><strong>Day:</strong> " . htmlspecialchars($shift['DayOfWeek']) . "</p>";
        echo "<p><strong>Start Time:</strong> " . htmlspecialchars($shift['StartTime']->format('H:i')) . "</p>";
        echo "<p><strong>End Time:</strong> " . htmlspecialchars($shift['EndTime']->format('H:i')) . "</p>";
        echo "</div>";
    } else {
        echo "<div class=\"{$shiftType}shift\">";
        echo "<h4>" . ucfirst($shiftType) . " Shift</h4>";
        echo "<p>No {$shiftType} shift available.</p>";
        echo "</div>";
    }
}

/**
 * Fetches and displays all recipe names from the database.
 *
 * @param resource $conn Database connection resource.
 * @return array $recipes 
 */
function getAllRecipes($conn)
{
    $sql = "SELECT DISTINCT RecipeID FROM recipe";

    $stmt = sqlsrv_query($conn, $sql);
    if ($stmt === false) {
        die(print_r(sqlsrv_errors(), true));
    }

    $recipes = array();
    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
        $recipes[] = $row; 
    }

    sqlsrv_free_stmt($stmt);

    return $recipes; 
}

/**
 * Fetches and displays all ingredients necessary for a recipe from the database.
 *
 * @param resource $conn Database connection resource.
 * @param resource $recipeID the id of a recipe
 * @return array $ingredients 
 */
function getRecipeIngredients($conn, $recipeID)
{
    $sql = "{CALL GetRecipeIngredients(?)}";

    $params = array($recipeID);

    $stmt = sqlsrv_query($conn, $sql, $params);
    if ($stmt === false) {
        die(print_r(sqlsrv_errors(), true));
    }

    $ingredients = array();
    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
        $ingredients[] = $row;
    }

    sqlsrv_free_stmt($stmt);

    return $ingredients; 
}

/**
 * Displays a success or error message based on type
 *
 * @param resource $message as a string 
 * @param resource $messageType success/error
 * @return void 
 */
function displayMessage($message, $messageType) {
    if (!empty($message)) {
        $color = $messageType === 'error' ? 'red' : 'green'; // Determine the color based on message type
        echo "<p style='color: $color;'>$message</p>"; // Display the message
    }
}

?>