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

      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="user-btn" class="fas fa-user"></div>
         <?php
            $count_cart_items = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
            $count_cart_items->execute([$user_id]);

            $count_wishlist_items = $conn->prepare("SELECT * FROM `wishlist` WHERE user_id = ?");
            $count_wishlist_items->execute([$user_id]);
         ?>
         <a href="wishlist.php"><i class="fas fa-heart"></i><span>(<?= $count_wishlist_items->rowCount(); ?>)</span></a>
         <a href="cart.php"><i class="fas fa-shopping-cart"></i><span>(<?= $count_cart_items->rowCount(); ?>)</span></a>
      </div>

      <div class="profile">
         <?php
            $select_profile = $conn->prepare("SELECT * FROM `users` WHERE id = ?");
            $select_profile->execute([$user_id]);
            $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
         ?>
         <img src="uploaded_img/<?= $fetch_profile['profile_picture']; ?>" alt="">
         <p><?= $fetch_profile['name']; ?></p>
         <a href="user_update_profile.php" class="btn">update profile</a>
         <a href="logout.php" class="delete-btn">logout</a>
      </div>

   </div>

</header>

<!-- ✅ Modern sliding alert container -->
<div class="message-container">
<?php
if(isset($message)){
   foreach($message as $msg){
      echo '
      <div class="message">
         <span>'.$msg.'</span>
         <i class="fas fa-times"></i>
      </div>
      ';
   }
}
?>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
   const userBtn = document.querySelector('#user-btn');
   const userBox = document.querySelector('.profile');
   if (userBtn && userBox) {
      userBtn.addEventListener('click', () => {
         userBox.classList.toggle('active');
      });
   }

   // ✅ Handle message alerts
   const messages = document.querySelectorAll('.message');
   messages.forEach((msg, index) => {
      // Slide in animation
      setTimeout(() => msg.classList.add('show'), 100 * index);

      // Auto close after 4s
      setTimeout(() => {
         msg.classList.remove('show');
         setTimeout(() => msg.remove(), 500);
      }, 4000 + (index * 500));

      // Close on click
      msg.querySelector('i').addEventListener('click', () => {
         msg.classList.remove('show');
         setTimeout(() => msg.remove(), 500);
      });
   });
});
</script>

<style>
/* ✅ Toast container (top right corner) */
.message-container {
   position: fixed;
   top: 20px;
   right: 20px;
   z-index: 9999;
   display: flex;
   flex-direction: column;
   gap: 10px;
}

/* ✅ Modern message box */
.message {
   background: linear-gradient(135deg, #4ade80, #22c55e);
   color: #fff;
   padding: 12px 16px;
   border-radius: 8px;
   min-width: 250px;
   max-width: 350px;
   display: flex;
   justify-content: space-between;
   align-items: center;
   box-shadow: 0 4px 10px rgba(0,0,0,0.2);
   font-size: 14px;
   opacity: 0;
   transform: translateX(120%);
   transition: all 0.4s ease-in-out;
   cursor: default;
}

.message.show {
   opacity: 1;
   transform: translateX(0);
}

.message span {
   flex: 1;
}

.message i {
   margin-left: 12px;
   cursor: pointer;
   color: #fff;
   font-size: 16px;
   transition: transform 0.2s;
}
.message i:hover {
   transform: scale(1.2);
}
</style>
