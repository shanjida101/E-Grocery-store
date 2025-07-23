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
   <link rel="stylesheet" href="css/style.css">
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
         echo <p>
   <?= htmlspecialchars($fetch_cart_items['name']); ?>
   <span>(<?= '$' . number_format($fetch_cart_items['price'], 2) . ' x ' . $fetch_cart_items['quantity']; ?>)</span>
</p>
         "<div class='order-item'>";
         echo "<span>" . htmlspecialchars($item['name']) . " (x" . $item['quantity'] . ")</span>";
         echo "<span class='price'>$" . number_format($total, 2) . "</span>";
         echo "</div>";

      }
      echo "<div class='grand-total'>Grand Total: <span>$${grand_total}</span></div>";
   } else {
      echo "<p class='empty'>Your cart is empty!</p>";
   }
   ?>
</section>

<section class="checkout-orders">
   <form method="POST">
      <h3>Place Your Order</h3>
      <div class="flex">
         <div class="inputBox"><span>Name:</span><input type="text" name="name" required class="box"></div>
         <div class="inputBox"><span>Phone:</span><input type="number" name="number" required class="box"></div>
         <div class="inputBox"><span>Email:</span><input type="email" name="email" required class="box"></div>
         <div class="inputBox">
            <span>Payment Method:</span>
            <select name="method" class="box" required>
               <option value="cash on delivery">Cash on Delivery</option>
               <option value="credit card">Credit Card</option>
               <option value="paytm">Paytm</option>
               <option value="paypal">Paypal</option>
            </select>
         </div>
         <div class="inputBox"><span>Flat No.:</span><input type="text" name="flat" required class="box"></div>
         <div class="inputBox"><span>Street:</span><input type="text" name="street" required class="box"></div>
         <div class="inputBox"><span>City:</span><input type="text" name="city" required class="box"></div>
         <div class="inputBox"><span>State:</span><input type="text" name="state" required class="box"></div>
         <div class="inputBox"><span>Country:</span><input type="text" name="country" required class="box"></div>
         <div class="inputBox"><span>Pin Code:</span><input type="number" name="pin_code" required class="box"></div>
      </div>
      <input type="submit" name="order" class="btn <?= ($grand_total > 0) ? '' : 'disabled'; ?>" value="Place Order">
   </form>
</section>

</body>
</html>
