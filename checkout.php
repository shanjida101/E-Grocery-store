<?php
@include 'config.php';
session_start();

$user_id = $_SESSION['user_id'] ?? null;

if (!$user_id) {
    header('location:login.php');
    exit;
}

if (isset($_POST['order'])) {
    $name = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
    $number = filter_var($_POST['number'], FILTER_SANITIZE_STRING);
    $email = filter_var($_POST['email'], FILTER_SANITIZE_STRING);
    $method = filter_var($_POST['method'], FILTER_SANITIZE_STRING);

    $address = 'Flat: ' . $_POST['flat'] . ', ' . $_POST['street'] . ', ' . $_POST['city'] . ', ' .
               $_POST['state'] . ', ' . $_POST['country'] . ' - ' . $_POST['pin_code'];
    $address = filter_var($address, FILTER_SANITIZE_STRING);
    $placed_on = date('d-M-Y');

    $cart_total = 0;
    $cart_products = [];

    $cart_query = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
    $cart_query->execute([$user_id]);

    if ($cart_query->rowCount() > 0) {
        while ($cart_item = $cart_query->fetch(PDO::FETCH_ASSOC)) {
            $cart_products[] = $cart_item['name'] . ' (x' . $cart_item['quantity'] . ')';
            $cart_total += $cart_item['price'] * $cart_item['quantity'];
        }
    }

    $total_products = implode(', ', $cart_products);

    $order_exists = $conn->prepare("SELECT * FROM `orders` WHERE name = ? AND number = ? AND email = ? AND method = ? AND address = ? AND total_products = ? AND total_price = ?");
    $order_exists->execute([$name, $number, $email, $method, $address, $total_products, $cart_total]);

    if ($cart_total == 0) {
        $message[] = 'Your cart is empty.';
    } elseif ($order_exists->rowCount() > 0) {
        $message[] = 'Order already placed!';
    } else {
        $insert_order = $conn->prepare("INSERT INTO `orders` (user_id, name, number, email, method, address, total_products, total_price, placed_on) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $insert_order->execute([$user_id, $name, $number, $email, $method, $address, $total_products, $cart_total, $placed_on]);

        $delete_cart = $conn->prepare("DELETE FROM `cart` WHERE user_id = ?");
        $delete_cart->execute([$user_id]);

        $message[] = 'Order placed successfully!';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/checkout.css">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.5.2/css/all.min.css">
</head>
<body>

<?php include 'header.php'; ?>

<section class="display-orders">
    <h2>Your Order Summary</h2>
    <?php
    $cart_grand_total = 0;
    $cart_query = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
    $cart_query->execute([$user_id]);
    if ($cart_query->rowCount() > 0) {
        while ($cart_item = $cart_query->fetch(PDO::FETCH_ASSOC)) {
            $total = $cart_item['price'] * $cart_item['quantity'];
            $cart_grand_total += $total;
            echo "<p>{$cart_item['name']} <span>(৳{$cart_item['price']} × {$cart_item['quantity']})</span></p>";
        }
    } else {
        echo '<p class="empty">Your cart is empty!</p>';
    }
    ?>
    <div class="grand-total">Grand Total: <span>৳<?= $cart_grand_total; ?></span></div>
</section>

<section class="checkout-orders">
    <form action="" method="POST">
        <h3>Shipping Information</h3>
        <div class="flex">
            <div class="inputBox">
                <span>Your Name:</span>
                <input type="text" name="name" placeholder="Enter your name" class="box" required>
            </div>
            <div class="inputBox">
                <span>Your Number:</span>
                <input type="number" name="number" placeholder="Enter your number" class="box" required>
            </div>
            <div class="inputBox">
                <span>Your Email:</span>
                <input type="email" name="email" placeholder="Enter your email" class="box" required>
            </div>
            <div class="inputBox">
                <span>Address Line 1:</span>
                <input type="text" name="flat" placeholder="Flat No." class="box" required>
            </div>
            <div class="inputBox">
                <span>Address Line 2:</span>
                <input type="text" name="street" placeholder="Street" class="box" required>
            </div>
            <div class="inputBox">
                <span>City:</span>
                <input type="text" name="city" placeholder="City" class="box" required>
            </div>
            <div class="inputBox">
                <span>State:</span>
                <input type="text" name="state" placeholder="State" class="box" required>
            </div>
            <div class="inputBox">
                <span>Country:</span>
                <input type="text" name="country" placeholder="Country" class="box" required>
            </div>
            <div class="inputBox">
                <span>Pin Code:</span>
                <input type="number" name="pin_code" placeholder="Postal Code" class="box" required>
            </div>
            <div class="inputBox">
                <span>Payment Method:</span>
                <select name="method" class="box" required>
                    <option value="Cash on Delivery">Cash on Delivery</option>
                    <option value="Bkash">Bkash</option>
                    <option value="Nagad">Nagad</option>
                    <option value="Card">Credit/Debit Card</option>
                </select>
            </div>
        </div>

        <input type="submit" name="order" class="btn <?= ($cart_grand_total > 0 ? '' : 'disabled'); ?>" value="Confirm Order">
    </form>
</section>

<?php include 'footer.php'; ?>

</body>
</html>
