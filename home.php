<?php

@include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
};

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
      $message[] = 'already added to wishlist!';
   } elseif($check_cart->rowCount() > 0){
      $message[] = 'already added to cart!';
   } else {
      $insert = $conn->prepare("INSERT INTO `wishlist`(user_id, pid, name, price, image) VALUES(?,?,?,?,?)");
      $insert->execute([$user_id, $pid, $p_name, $p_price, $p_image]);
      $message[] = 'added to wishlist!';
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
      $message[] = 'already added to cart!';
   } else {
      $check_wishlist = $conn->prepare("SELECT * FROM `wishlist` WHERE name = ? AND user_id = ?");
      $check_wishlist->execute([$p_name, $user_id]);
      if($check_wishlist->rowCount() > 0){
         $delete = $conn->prepare("DELETE FROM `wishlist` WHERE name = ? AND user_id = ?");
         $delete->execute([$p_name, $user_id]);
      }
      $insert = $conn->prepare("INSERT INTO `cart`(user_id, pid, name, price, quantity, image) VALUES(?,?,?,?,?,?)");
      $insert->execute([$user_id, $pid, $p_name, $p_price, $p_qty, $p_image]);
      $message[] = 'added to cart!';
   }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <title>Home Page</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/home.css">
   <style>
      .search-bar {
         display: flex;
         align-items: center;
         border: 1px solid #ccc;
         border-radius: 5px;
         background: #fff;
         overflow: hidden;
         margin-left: 20px;
      }
      .search-bar input[type="text"] {
         padding: 10px;
         border: none;
         font-size: 16px;
         outline: none;
      }
      .search-bar button {
         padding: 10px 15px;
         background: green;
         color: white;
         border: none;
         cursor: pointer;
         font-size: 16px;
      }
      .search-results-title {
         text-align: center;
         font-size: 22px;
         margin: 10px 0 20px;
      }
      .back-home {
         text-align: center;
         margin-bottom: 20px;
      }
      .back-home a {
         color: green;
         text-decoration: underline;
         font-weight: bold;
      }
.discount-offer {
  background: linear-gradient(135deg, #e6fff5, #ccffe0); /* soft green gradient */
  border-radius: 1rem;
  margin: 3rem auto;
  padding: 2.5rem 1.5rem;
  text-align: center;
  max-width: 1000px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

.discount-offer .offer-content i {
  font-size: 2rem;
  color: #0d9f4d; /* icon in match green */
  margin-bottom: 0.5rem;
}

.discount-offer .offer-content h2 {
  color: #064e3b; /* deep leafy green */
  font-size: 1.8rem;
  margin: 0.5rem 0;
}

.discount-offer .offer-content p {
  font-size: 1.1rem;
  color: #3f3f46; /* neutral dark gray for contrast */
  margin: 0.5rem 0 1rem;
}

.shop-now-btn {
  display: inline-block;
  padding: 0.7rem 1.5rem;
  font-size: 1rem;
  background-color: #0f9d58; /* Google's green shade, very eye-catching */
  color: white;
  border-radius: 0.5rem;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.shop-now-btn:hover {
  background-color: #0b7c44; /* slightly darker green on hover */
}


.delivery-locations {
   margin: 4rem auto;
   padding: 5rem 2rem;
   text-align: center;
   border-radius: 12px;
   position: relative;
   color: #fff;
}

.delivery-locations .overlay {
   background-color: rgba(0, 0, 0, 0.5); /* dark transparent overlay */
   padding: 4rem 2rem;
   border-radius: 12px;
}

.delivery-locations h2 {
   font-size: 2.5rem;
   font-weight: 700;
   margin-bottom: 2rem;
}

.city-buttons {
   display: flex;
   justify-content: center;
   gap: 1.5rem;
   flex-wrap: wrap;
}

.city-btn {
   background-color: #facc15;
   color: #1f2937;
   padding: 0.8rem 2rem;
   font-size: 1rem;
   font-weight: 600;
   border: none;
   border-radius: 999px;
   box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
   cursor: pointer;
   transition: all 0.3s ease;
}

.city-btn:hover {
   background-color: #eab308;
   transform: scale(1.05);
}



.faq {
  background: #f0fdf4; /* very light green for freshness */
  padding: 3rem 2rem;
  border-radius: 1rem;
  max-width: 1000px;
  margin: 3rem auto;
  box-shadow: 0 0 12px rgba(0, 128, 0, 0.08); /* soft green glow */
}

.faq .faq-box {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.faq .faq-item h4 {
  font-size: 1.3rem;
  color: #065f46; /* dark green title */
  margin-bottom: 0.3rem;
  font-weight: 600;
}

.faq .faq-item p {
  color: #334155; /* dark cool-gray for readability */
  line-height: 1.6;
  font-size: 1rem;
}

   </style>
</head>
<body>

<?php if(isset($message)){ foreach($message as $msg){ ?>
<div class="message">
   <span><?= $msg; ?></span>
   <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
</div>
<?php }} ?>

<header class="header">
   <div class="flex">
      <img src="uploaded_img/logo.png" class="logo" alt="">
      <nav class="navbar">
         <a href="home.php">home</a>
         <a href="shop.php">shop</a>
         <a href="orders.php">orders</a>
         <a href="about.php">about</a>
         <a href="contact.php">contact</a>
      </nav>
      <form action="home.php" method="GET" class="search-bar">
         <input type="text" name="search" placeholder="Search products..." required>
         <button type="submit" class="fas fa-search"></button>
      </form>
      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="user-btn" class="fas fa-user"></div>
         <?php
            $count_cart = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
            $count_cart->execute([$user_id]);
            $count_wishlist = $conn->prepare("SELECT * FROM `wishlist` WHERE user_id = ?");
            $count_wishlist->execute([$user_id]);
         ?>
         <a href="wishlist.php"><i class="fas fa-heart"></i><span>(<?= $count_wishlist->rowCount(); ?>)</span></a>
         <a href="cart.php"><i class="fas fa-shopping-cart"></i><span>(<?= $count_cart->rowCount(); ?>)</span></a>
      </div>
      <div class="profile">
         <?php
            $profile = $conn->prepare("SELECT * FROM `users` WHERE id = ?");
            $profile->execute([$user_id]);
            $user = $profile->fetch(PDO::FETCH_ASSOC);
         ?>
         <img src="uploaded_img/<?= $user['profile_picture']; ?>" alt="">
         <p><?= $user['name']; ?></p>
         <a href="user_profile_update.php" class="btn">update profile</a>
         <a href="logout.php" class="delete-btn">logout</a>
      </div>
   </div>
</header>

<?php if(!isset($_GET['search'])): ?>

<div class="home-bg">
   <section class="promo-banner">
      <div class="promo-content">
         <img src="uploaded_img/banner.jpg" alt="" class="promo-bg">
         <div class="promo-text-overlay">
            <h2>Fresh organic veggies.<br><span>Simple solution for your day-to-day life</span></h2>
            <p>Get the freshest groceries delivered right to your home.</p>
            <a href="delivery.php" class="learn-more-btn">Learn More →</a>
         </div>
      </div>
   </section>
</div>

<section class="home-category">
   <h1 class="title">shop by category</h1>
   <div class="box-container">
      <div class="box"><img src="uploaded_img/cat-1.png" alt=""><h3>fruits</h3><p>Buy the fresh fruits from here</p><a href="category.php?category=fruits" class="btn">fruits</a></div>
      <div class="box"><img src="uploaded_img/cat-2.png" alt=""><h3>meat</h3><p>Buy the fresh meat from here</p><a href="category.php?category=meat" class="btn">meat</a></div>
      <div class="box"><img src="uploaded_img/cat-3.png" alt=""><h3>vegitables</h3><p>Buy the fresh vegitables from here</p><a href="category.php?category=vegitables" class="btn">vegitables</a></div>
   </div>
</section>


<section class="discount-offer">
   <div class="offer-content">
      <i class="fas fa-tags"></i>
      <h2>Special Discount Offers!</h2>
      <p>Save up to <strong>30%</strong> on selected fruits and vegetables every weekend.</p>
      <a href="shop.php" class="shop-now-btn">Shop Now</a>
   </div>
</section>


<section class="delivery-locations" style="background: url('uploaded_img/delivery-bg.png') center/cover no-repeat;">
   <div class="overlay">
      <h2>Currently Delivering in</h2>
      <div class="city-buttons">
         <button class="city-btn">Dhaka</button>
         <button class="city-btn">Chattogram</button>
         <button class="city-btn">Jashore</button>
      </div>
   </div>
</section>

<section class="faq">
   <h2 class="title">Frequently Asked Questions</h2>
   <div class="faq-box">
      <div class="faq-item">
         <h4>How do I place an order?</h4>
         <p>Simply browse the shop, add items to your cart, and proceed to checkout.</p>
      </div>
      <div class="faq-item">
         <h4>Can I track my delivery?</h4>
         <p>Yes, you will get update_pass email after you place your order.</p>
      </div>
      <div class="faq-item">
         <h4>Do you deliver outside Dhaka?</h4>
         <p>Currently, we deliver only within Dhaka, Josore, Chittagong. We’ll expand soon!</p>
      </div>
   </div>
</section>

<?php endif; ?>

<section class="products">
   <h1 class="title">latest products</h1>

   <?php
      if(isset($_GET['search']) && $_GET['search'] !== ''){
         $search = filter_var($_GET['search'], FILTER_SANITIZE_STRING);
         $stmt = $conn->prepare("SELECT * FROM `products` WHERE name LIKE ? OR category LIKE ?");
         $stmt->execute(["%$search%", "%$search%"]);
         echo '<h2 class="search-results-title">Search Results for: <em>' . htmlspecialchars($search) . '</em></h2>';
         echo '<div class="back-home"><a href="home.php">← Back to Home</a></div>';
      } else {
         $stmt = $conn->prepare("SELECT * FROM `products` LIMIT 6");
         $stmt->execute();
      }

      echo '<div class="box-container">';
      if($stmt->rowCount() > 0){
         while($product = $stmt->fetch(PDO::FETCH_ASSOC)){
   ?>

   <form action="" method="POST" class="box">
      <div class="price">৳<span><?= $product['price']; ?></span>/-</div>
      <img src="uploaded_img/<?= $product['image']; ?>" alt="">
      <div class="name"><?= $product['name']; ?></div>
      <input type="hidden" name="pid" value="<?= $product['id']; ?>">
      <input type="hidden" name="p_name" value="<?= $product['name']; ?>">
      <input type="hidden" name="p_price" value="<?= $product['price']; ?>">
      <input type="hidden" name="p_image" value="<?= $product['image']; ?>">
      <div class="quantity-box">
         <button type="button" class="qty-btn minus">–</button>
         <input type="number" min="1" value="1" name="p_qty" class="qty-input">
         <button type="button" class="qty-btn plus">+</button>
      </div>
      <input type="submit" value="add to wishlist" class="option-btn" name="add_to_wishlist">
      <input type="submit" value="add to cart" class="btn" name="add_to_cart">
   </form>

   <?php } } else { echo '<p class="empty">No products found!</p>'; } ?>
   </div>
</section>

<footer class="footer">
   <section class="box-container">
      <div class="box">
         <h3>useful links</h3>
         <a href="cart.php"> <i class="fas fa-angle-right"></i> cart</a>
         <a href="wishlist.php"> <i class="fas fa-angle-right"></i> wishlist</a>
         <a href="login.php"> <i class="fas fa-angle-right"></i> login</a>
         <a href="register.php"> <i class="fas fa-angle-right"></i> register</a>
      </div>
      <div class="box">
         <h3>contact info</h3>
         <p><i class="fas fa-phone"></i> 01744842744</p>
         <p><i class="fas fa-envelope"></i> shanjida@gmail.com</p>
         <p><i class="fas fa-map-marker-alt"></i> DHAKA, BANGLADESH</p>
      </div>
      <div class="box">
         <h3>follow us</h3>
         <a href="#"><i class="fab fa-facebook-f"></i> facebook</a>
         <a href="#"><i class="fab fa-twitter"></i> twitter</a>
         <a href="#"><i class="fab fa-instagram"></i> instagram</a>
         <a href="#"><i class="fab fa-linkedin"></i> linkedin</a>
      </div>
   </section>
   <p class="credit"> &copy; <?= date('Y'); ?> by <span>Shanjida</span> | all rights reserved! </p>
</footer>

<script>
   document.querySelector('#menu-btn').onclick = () => {
      document.querySelector('.navbar').classList.toggle('active');
      document.querySelector('.profile').classList.remove('active');
   };
   document.querySelector('#user-btn').onclick = () => {
      document.querySelector('.profile').classList.toggle('active');
      document.querySelector('.navbar').classList.remove('active');
   };
   document.querySelectorAll('.quantity-box').forEach(box => {
      const input = box.querySelector('.qty-input');
      box.querySelector('.plus').onclick = () => { input.value = parseInt(input.value) + 1; };
      box.querySelector('.minus').onclick = () => {
         if (parseInt(input.value) > 1) input.value = parseInt(input.value) - 1;
      };
   });
</script>

</body>
</html>
