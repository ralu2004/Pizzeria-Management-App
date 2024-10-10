<?php
$pages = [
    'index' => 'Home',
    'customers'=> 'Customers',
    'orders' => 'Orders',
    'staff' => 'Staff',
    'inventory' => 'Inventory',
    'recipes' => 'Recipes'
];

// Get the current page name (e.g., index, orders) without the .php extension
$current_page = basename($_SERVER['PHP_SELF'], '.php');
?>

<nav class="navbar">
    <ul>
        <?php foreach ($pages as $page => $title): ?>
            <li><a href="<?php echo $page; ?>.php" class="<?php echo ($current_page == $page) ? 'active' : ''; ?>"><?php echo $title; ?></a></li>
        <?php endforeach; ?>
    </ul>
</nav>
