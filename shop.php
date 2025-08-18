<?php
@include 'config.php';
session_start();

$user_id = $_SESSION['user_id'];
if(!isset($user_id)){
   header('location:login.php');
}

// Add to Wishlist
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
      $add = $conn->prepare("INSERT INTO `wishlist`(user_id, pid, name, price, image) VALUES(?,?,?,?,?)");
      $add->execute([$user_id, $pid, $p_name, $p_price, $p_image]);
      $message[] = 'Added to wishlist!';
   }
}

// Add to Cart
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
         $delete_wishlist = $conn->prepare("DELETE FROM `wishlist` WHERE name = ? AND user_id = ?");
         $delete_wishlist->execute([$p_name, $user_id]);
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
   <title>Shop - All Products</title>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/shop.css">
</head>
<body>

<?php include 'header.php'; ?>

<section class="p-category">
   <a href="category.php?category=fruits">Fruits</a>
   <a href="category.php?category=Vegetables">Vegetables</a>
   <a href="category.php?category=meat">Meat</a>
</section>

<section class="products">
   <h1 class="title">All Products</h1>
   <div class="box-container">
   <?php
      $select_products = $conn->prepare("SELECT * FROM `products`");
      $select_products->execute();

      if($select_products->rowCount() > 0){
         while($fetch = $select_products->fetch(PDO::FETCH_ASSOC)){ 
   ?>
 <form action="" method="POST" class="box">
   <a href="view_page.php?pid=<?= $fetch['id']; ?>" class="product-click-area">
      <img src="uploaded_img/<?= $fetch['image']; ?>" alt="">
      <div class="name"><?= $fetch['name']; ?></div>
   </a>

   <div class="price">৳<span><?= $fetch['price']; ?></span>/-</div>

   <input type="hidden" name="pid" value="<?= $fetch['id']; ?>">
   <input type="hidden" name="p_name" value="<?= $fetch['name']; ?>">
   <input type="hidden" name="p_details" value="<?= $fetch['details']; ?>">
   <input type="hidden" name="p_price" value="<?= $fetch['price']; ?>">
   <input type="hidden" name="p_image" value="<?= $fetch['image']; ?>">

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
         echo '<p class="empty">No products available.</p>';
      }
   ?>
   </div>
</section>
<script>
document.querySelectorAll('.box').forEach(box => {
   const qtyInput = box.querySelector('.qty-input');
   const plusBtn = box.querySelector('.plus');
   const minusBtn = box.querySelector('.minus');

   plusBtn.onclick = () => {
      let qty = parseInt(qtyInput.value);
      qtyInput.value = ++qty;
   };

   minusBtn.onclick = () => {
      let qty = parseInt(qtyInput.value);
      if (qty > 1) {
         qtyInput.value = --qty;
      }
   };
});
</script>

<?php include 'footer.php'; ?>



</body>
</html>
