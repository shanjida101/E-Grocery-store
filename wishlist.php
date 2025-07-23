<?php
@include 'config.php';
session_start();

$user_id = $_SESSION['user_id'] ?? null;
if (!$user_id) {
    header('location:login.php');
    exit;
}

// Handle adding to cart
if (isset($_POST['add_to_cart'])) {
    $pid = filter_var($_POST['pid'], FILTER_SANITIZE_STRING);
    $p_name = filter_var($_POST['p_name'], FILTER_SANITIZE_STRING);
    $p_price = filter_var($_POST['p_price'], FILTER_SANITIZE_STRING);
    $p_image = filter_var($_POST['p_image'], FILTER_SANITIZE_STRING);
    $p_qty = filter_var($_POST['p_qty'], FILTER_SANITIZE_STRING);

    $check_cart = $conn->prepare("SELECT * FROM cart WHERE name = ? AND user_id = ?");
    $check_cart->execute([$p_name, $user_id]);

    if ($check_cart->rowCount() > 0) {
        $message[] = 'Already in cart!';
    } else {
        $conn->prepare("DELETE FROM wishlist WHERE name = ? AND user_id = ?")->execute([$p_name, $user_id]);
        $conn->prepare("INSERT INTO cart (user_id, pid, name, price, quantity, image) VALUES (?, ?, ?, ?, ?, ?)")
             ->execute([$user_id, $pid, $p_name, $p_price, $p_qty, $p_image]);
        $message[] = 'Added to cart!';
    }
}

// Handle delete
if (isset($_GET['delete'])) {
    $delete_id = $_GET['delete'];
    $conn->prepare("DELETE FROM wishlist WHERE id = ?")->execute([$delete_id]);
    header('location:wishlist.php');
}

// Handle delete all
if (isset($_GET['delete_all'])) {
    $conn->prepare("DELETE FROM wishlist WHERE user_id = ?")->execute([$user_id]);
    header('location:wishlist.php');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Wishlist</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/wishlist.css">
</head>
<body>

<?php include 'header.php'; ?>

<section class="wishlist">
    <h1 class="title">Your Wishlist</h1>
    <div class="box-container">
        <?php
        $grand_total = 0;
        $wishlist = $conn->prepare("SELECT * FROM wishlist WHERE user_id = ?");
        $wishlist->execute([$user_id]);

        if ($wishlist->rowCount() > 0):
            while ($item = $wishlist->fetch(PDO::FETCH_ASSOC)):
                $grand_total += $item['price'];
        ?>
<a href="view_page.php?pid=<?= $item['pid']; ?>" class="box" style="text-decoration: none; color: inherit;">
<form method="POST" class="box-inner">

            <img src="uploaded_img/<?= $item['image']; ?>" alt="">
            <div class="name"><?= $item['name']; ?></div>
            <div class="price">৳<?= $item['price']; ?>/-</div>
            <input type="number" name="p_qty" min="1" value="1" class="qty">
            <input type="hidden" name="pid" value="<?= $item['pid']; ?>">
            <input type="hidden" name="p_name" value="<?= $item['name']; ?>">
            <input type="hidden" name="p_price" value="<?= $item['price']; ?>">
            <input type="hidden" name="p_image" value="<?= $item['image']; ?>">
            <input type="submit" name="add_to_cart" value="Add to Cart" class="btn">
        </form>
        <?php endwhile; else: ?>
            <p class="empty">Your wishlist is empty</p>
        <?php endif; ?>
    </div>

    <div class="wishlist-total">
        <p>Grand Total: <span>৳<?= $grand_total; ?>/-</span></p>
        <a href="shop.php" class="option-btn">Continue Shopping</a>
        <a href="wishlist.php?delete_all" class="delete-btn <?= ($grand_total > 1) ? '' : 'disabled'; ?>">Delete All</a>
    </div>
</section>

<?php include 'footer.php'; ?>

</body>
</html>
