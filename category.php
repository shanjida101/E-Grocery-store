<?php
@include 'config.php';
session_start();

$user_id = $_SESSION['user_id'];
if(!isset($user_id)){
   header('location:login.php');
}

if(isset($_POST['add_to_wishlist'])){
   $pid = filter_var($_POST['pid'], FILTER_SANITIZE_STRING);
   $p_name = filter_var($_POST['p_name'], FILTER_SANITIZE_STRING);
   $p_price = filter_var($_POST['p_price'], FILTER_SANITIZE_STRING);
   $p_image = filter_var($_POST['p_image'], FILTER_SANITIZE_STRING);

   $check_wishlist = $conn->prepare("SELECT * FROM `wishlist` WHERE name = ? AND user_id = ?");
   $check_wishlist->execute([$p_name, $user_id]);

   $check_cart = $conn->prepare("SELECT * FROM `cart` WHERE name = ? AND user_id = ?");
   $check_cart->execute([$p_name, $user_id]);

   if($check_wishlist->rowCount() > 0){
      $message[] = 'Already in wishlist!';
   } elseif($check_cart->rowCount() > 0){
      $message[] = 'Already in cart!';
   } else {
      $insert = $conn->prepare("INSERT INTO `wishlist`(user_id, pid, name, price, image) VALUES(?,?,?,?,?)");
      $insert->execute([$user_id, $pid, $p_name, $p_price, $p_image]);
      $message[] = 'Added to wishlist!';
   }
}

if(isset($_POST['add_to_cart'])){
   $pid = filter_var($_POST['pid'], FILTER_SANITIZE_STRING);
   $p_name = filter_var($_POST['p_name'], FILTER_SANITIZE_STRING);
   $p_price = filter_var($_POST['p_price'], FILTER_SANITIZE_STRING);
   $p_image = filter_var($_POST['p_image'], FILTER_SANITIZE_STRING);
   $p_qty = filter_var($_POST['p_qty'], FILTER_SANITIZE_STRING);

   $check_cart = $conn->prepare("SELECT * FROM `cart` WHERE name = ? AND user_id = ?");
   $check_cart->execute([$p_name, $user_id]);

   if($check_cart->rowCount() > 0){
      $message[] = 'Already in cart!';
   } else {
      $check_wishlist = $conn->prepare("SELECT * FROM `wishlist` WHERE name = ? AND user_id = ?");
      $check_wishlist->execute([$p_name, $user_id]);

      if($check_wishlist->rowCount() > 0){
         $delete = $conn->prepare("DELETE FROM `wishlist` WHERE name = ? AND user_id = ?");
         $delete->execute([$p_name, $user_id]);
      }

      $insert = $conn->prepare("INSERT INTO `cart`(user_id, pid, name, price, quantity, image) VALUES(?,?,?,?,?,?)");
      $insert->execute([$user_id, $pid, $p_name, $p_price, $p_qty, $p_image]);
      $message[] = 'Added to cart!';
   }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Category</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/home.css">
   <link rel="stylesheet" href="css/shop.css"> <!-- Ensure this has updated product styles -->
</head>
<body>

<?php include 'header.php'; ?>

<section class="products">
   <h1 class="title">Products by Category</h1>
   <div class="box-container">
   <?php
      $category_name = $_GET['category'];
      $select = $conn->prepare("SELECT * FROM `products` WHERE category = ?");
      $select->execute([$category_name]);

      if($select->rowCount() > 0){
         while($product = $select->fetch(PDO::FETCH_ASSOC)){
   ?>
   <form action="" class="box" method="POST">
      <a href="view_page.php?pid=<?= $product['id']; ?>" class="product-click-area">
         <img src="uploaded_img/<?= $product['image']; ?>" alt="">
         <div class="name"><?= $product['name']; ?></div>
      </a>

      <div class="price">৳<span><?= $product['price']; ?></span>/-</div>

      <input type="hidden" name="pid" value="<?= $product['id']; ?>">
      <input type="hidden" name="p_name" value="<?= $product['name']; ?>">
      <input type="hidden" name="p_price" value="<?= $product['price']; ?>">
      <input type="hidden" name="p_image" value="<?= $product['image']; ?>">

      <div class="quantity-wrapper">
         <button type="button" class="qty-btn minus">–</button>
         <input type="number" name="p_qty" value="1" class="qty-input" readonly>
         <button type="button" class="qty-btn plus">+</button>
      </div>

      <input type="submit" value="Add to Wishlist" class="option-btn" name="add_to_wishlist">
      <input type="submit" value="Add to Cart" class="btn" name="add_to_cart">
   </form>
   <?php
         }
      } else {
         echo '<p class="empty">No products available in this category!</p>';
      }
   ?>
   </div>
</section>

<?php include 'footer.php'; ?>

<script>
document.querySelectorAll('.box').forEach(box => {
   const qtyInput = box.querySelector('.qty-input');
   const plus = box.querySelector('.plus');
   const minus = box.querySelector('.minus');

   plus.onclick = () => {
      qtyInput.value = parseInt(qtyInput.value) + 1;
   };
   minus.onclick = () => {
      if (parseInt(qtyInput.value) > 1) {
         qtyInput.value = parseInt(qtyInput.value) - 1;
      }
   };
});
</script>

</body>
</html>
