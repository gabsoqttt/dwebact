<?php
declare(strict_types = 1);

require_once 'includes/database-connection.php';
require_once 'includes/functions.php';

$sql = "SELECT id, name 
        FROM category 
        WHERE navigation = 1;";

$navigation = pdo($pdo, $sql)->fetchAll();



$sql = "SELECT 
            p.id,
            p.name,
            p.description,
            p.price,
            p.created,
            c.name AS category,
            i.file,
            i.alt
        FROM product p
        JOIN category c ON p.category_id = c.id
        LEFT JOIN image i ON p.image_id = i.id
        WHERE p.published = 1
        ORDER BY p.created DESC;";

$products = pdo($pdo, $sql)->fetchAll();

$section     = '';
$title       = 'Digital Store';
$description = 'Browse our digital products';

require_once 'includes/header.php';
?>

<main class="container" id="content">

  <h1>Digital Products</h1>

  <div class="grid">

    <?php foreach ($products as $product) { ?>

      <article class="summary">

        <!-- PRODUCT IMAGE -->
        <?php if ($product['file']) { ?>
          <img src="uploads/<?= html_escape($product['file']) ?>"
               alt="<?= html_escape($product['alt']) ?>">
        <?php } ?>

        <!-- PRODUCT NAME -->
        <h2><?= html_escape($product['name']) ?></h2>

        <!-- CATEGORY -->
        <p><strong>Category:</strong> 
          <?= html_escape($product['category']) ?>
        </p>

        <!-- DESCRIPTION -->
        <p><?= html_escape($product['description']) ?></p>

        <!-- PRICE -->
        <p><strong>$<?= html_escape($product['price']) ?></strong></p>

        <!-- DATE -->
        <p class="date">
          <?= format_date($product['created']) ?>
        </p>

      </article>

    <?php } ?>

  </div>

</main>

<?php require_once 'includes/footer.php'; ?>