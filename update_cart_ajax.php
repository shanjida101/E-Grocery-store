<?php
@include 'config.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
   $cart_id = $_POST['cart_id'] ?? '';
   $new_qty = $_POST['new_qty'] ?? '';

   if (!empty($cart_id) && !empty($new_qty) && is_numeric($new_qty)) {
      $update = $conn->prepare("UPDATE `cart` SET quantity = ? WHERE id = ?");
      if ($update->execute([$new_qty, $cart_id])) {
         echo json_encode(['success' => true, 'message' => 'Quantity updated']);
      } else {
         echo json_encode(['success' => false, 'message' => 'Update failed']);
      }
   } else {
      echo json_encode(['success' => false, 'message' => 'Invalid input']);
   }
} else {
   echo json_encode(['success' => false, 'message' => 'Invalid request']);
}
