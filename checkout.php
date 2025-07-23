<?php
@include 'config.php';
session_start();

if (!isset($_SESSION['user_id'])) {
   header('location:login.php');
   exit;
}

$user_id = $_SESSION['user_id'];

if (isset($_POST['order'])) {
   // Sanitize inputs
   $name    = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_STRING);
   $email   = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
   $number  = filter_input(INPUT_POST, 'number', FILTER_SANITIZE_STRING);
   $method  = filter_input(INPUT_POST, 'method', FILTER_SANITIZE_STRING);
   $address = filter_input(INPUT_POST, 'flat', FILTER_SANITIZE_STRING) . ', ' .
              filter_input(INPUT_POST, 'street', FILTER_SANITIZE_STRING) . ', ' .
              filter_input(INPUT_POST, 'city', FILTER_SANITIZE_STRING) . ', ' .
              filter_input(INPUT_POST, 'state', FILTER_SANITIZE_STRING) . ', ' .
              filter_input(INPUT_POST, 'country', FILTER_SANITIZE_STRING) . ' - ' .
              filter_input(INPUT_POST, 'pin_code', FILTER_SANITIZE_STRING);

   $placed_on = date('Y-m-d');
   $cart_total = 0;
   $cart_products = [];

   $cart_query = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
   $cart_query->execute([$user_id]);

   if ($cart_query->rowCount() > 0) {
      while ($item = $cart_query->fetch(PDO::FETCH_ASSOC)) {
         $cart_products[] = $item['name'] . " (x" . $item['quantity'] . ")";
         $cart_total += $item['price'] * $item['quantity'];
      }

      $total_products = implode(', ', $cart_products);

      // Check for duplicate order
      $check_order = $conn->prepare("SELECT 1 FROM `orders` WHERE name=? AND number=? AND email=? AND method=? AND address=? AND total_products=? AND total_price=?");
      $check_order->execute([$name, $number, $email, $method, $address, $total_products, $cart_total]);

      if ($check_order->rowCount() > 0) {
         $message[] = 'Order already placed!';
      } else {
         // Place the order
         $place_order = $conn->prepare("INSERT INTO `orders`(user_id, name, number, email, method, address, total_products, total_price, placed_on) VALUES(?,?,?,?,?,?,?,?,?)");
         $place_order->execute([$user_id, $name, $number, $email, $method, $address, $total_products, $cart_total, $placed_on]);

         // Clear cart
         $conn->prepare("DELETE FROM `cart` WHERE user_id = ?")->execute([$user_id]);

         $message[] = 'Order placed successfully!';
      }
   } else {
      $message[] = 'Your cart is empty!';
   }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <title>Checkout</title>
   <link rel="stylesheet" href="css/home.css">
   <link rel="stylesheet" href="css/checkout.css?v=1.5">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<body>

<?php include 'header.php'; ?>
<?php
if (!empty($message)) {
   foreach ($message as $msg) {
      echo "<div class='message'><span>$msg</span></div>";
   }
}
?>

<section class="display-orders">
   <?php
   $grand_total = 0;
   $cart_items = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
   $cart_items->execute([$user_id]);

   if ($cart_items->rowCount() > 0) {
      while ($item = $cart_items->fetch(PDO::FETCH_ASSOC)) {
         $total = $item['price'] * $item['quantity'];
         $grand_total += $total;
echo "<div class='order-item'>";
echo "<p>" . htmlspecialchars($item['name']) . " <span>(" . '৳' . number_format($item['price'], 2) . " x " . $item['quantity'] . ")</span></p>";
         echo "<span>" . htmlspecialchars($item['name']) . " (x" . $item['quantity'] . ")</span>";
         echo "<span class='price'>৳" . number_format($total, 2) . "</span>";
         echo "</div>";

      }
      echo '<div class="grand-total">Grand Total: <span> ৳' . number_format($grand_total, 2) . '</span></div>';
   } else {
      echo "<p class='empty'>Your cart is empty!</p>";
   }
   ?>
</section>
<section class="checkout-orders">

   <form action="" method="POST">

      <h3>🛒 Shipping Information</h3>

      <div class="flex">
         <div class="inputBox">
            <span>Your Name:</span>
            <input type="text" name="name" placeholder="Enter your name" class="box" required>
         </div>
         <div class="inputBox">
            <span>Your Number:</span>
            <input type="number" name="number" placeholder="Enter your phone number" class="box" required>
         </div>
         <div class="inputBox">
            <span>Your Email:</span>
            <input type="email" name="email" placeholder="Enter your email" class="box" required>
         </div>
         <div class="inputBox">
            <span>Flat / Apartment No.:</span>
            <input type="text" name="flat" placeholder="e.g. Flat 10B" class="box" required>
         </div>
         <div class="inputBox">
            <span>Street:</span>
            <input type="text" name="street" placeholder="e.g. Dhanmondi 27" class="box" required>
         </div>
         <div class="inputBox">
            <span>City:</span>
            <input type="text" name="city" placeholder="e.g. Dhaka" class="box" required>
         </div>
         <div class="inputBox">
            <span>State:</span>
            <input type="text" name="state" placeholder="e.g. Dhaka" class="box" required>
         </div>
         <div class="inputBox">
            <span>Country:</span>
            <input type="text" name="country" placeholder="e.g. Bangladesh" class="box" required>
         </div>
         <div class="inputBox">
            <span>Pin Code:</span>
            <input type="number" min="0" name="pin_code" placeholder="e.g. 1209" class="box" required>
         </div>
      </div>

      <h3>💳 Payment Method</h3>
      <div class="inputBox">
         <select name="method" class="box" required>
            <option value="">-- Select Payment Method --</option>
            <option value="Cash on Delivery">Cash on Delivery</option>
            <option value="Credit Card">Credit Card</option>
            <option value="bKash">bKash</option>
            <option value="Nagad">Nagad</option>
            <option value="Rocket">Rocket</option>
         </select>
      </div>

      <h3>✅ Order Confirmation</h3>
      <div class="confirmation">
         <p><strong>Total Products:</strong> <?= htmlspecialchars($total_products); ?></p>
         <p><strong>Grand Total:</strong> <span style="color:green;font-weight:bold;"><?= $cart_grand_total; ?> ৳</span></p>
      </div>

      <input type="submit" name="order" class="btn <?= ($cart_grand_total > 0)?'':'disabled'; ?>" value="Place Order">

   </form>

</section>

<?php include 'footer.php'; ?>
</body>
</html>
