<?php
include 'database.php'; 
include 'functions.php';
// Fetch all recipes initially
$recipes = getAllRecipes($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>PizzaRestaurantManagement - Home</title>
</head>

<body>
    <header>
        <h2>Recipes</h2>
    </header>

    <?php include 'navbar.php'; ?>

    <main>
        <h2>Get Recipe Ingredients</h2>
        <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST">
            <label for="recipeID"><strong>Recipe ID:</strong></label><br>
            <input id="box" type="text" name="recipeID" required><br>
            <input type="submit" value="Get Ingredients" id="i1">
        </form>

        <div>
            <h3>Available Recipes</h3>
            <ul>
                <?php foreach ($recipes as $recipe): ?>
                    <li>
                        <strong><?php echo htmlspecialchars($recipe['RecipeID']); ?></strong>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>

        <div>
            <?php
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $recipeID = htmlspecialchars(trim($_POST['recipeID'])); 

                $ingredients = getRecipeIngredients($conn, $recipeID);

                if (!empty($ingredients)) {
                    echo "<h3>Ingredients for Recipe ID: " . htmlspecialchars($recipeID) . "</h3>";
                    echo "<ul>";
                    foreach ($ingredients as $ingredient) {
                        echo "<li>" . htmlspecialchars($ingredient['IngredientName']) . ": " . htmlspecialchars($ingredient['Quantity']) . " grams</li>";
                    }
                    echo "</ul>";
                } else {
                    echo "No ingredients found for Recipe ID: " . htmlspecialchars($recipeID) . ".";
                }
            }
            sqlsrv_close($conn);
            ?>
        </div>
    </main>

    <?php include 'footer.php'; ?>
    
</body>

</html>
