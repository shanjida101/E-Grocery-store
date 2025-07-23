<?php
if (session_status() === PHP_SESSION_NONE) session_start();
include 'config.php';

$admin_id = $_SESSION['admin_id'] ?? null;
$fetch_profile = null;

if ($admin_id) {
$select_profile = $conn->prepare("SELECT * FROM `users` WHERE id = ?");
   $select_profile->setFetchMode(PDO::FETCH_ASSOC);
   $select_profile->bindParam(1, $admin_id, PDO::PARAM_INT);
   $select_profile->execute([$admin_id]);
   $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
}
?>

<?php if (isset($message)) {
   foreach ($message as $msg) {
      echo '
      <div class="message">
         <span>' . htmlspecialchars($msg) . '</span>
         <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>';
   }
} ?>

<header class="header">

   <div class="flex">

      <a href="admin_page.php" class="logo">Admin<span>Panel</span></a>

      <nav class="navbar">
         <a href="admin_page.php">HOME</a>
         <a href="admin_products.php">PRODUCTS</a>
         <a href="admin_orders.php">ORDERS</a>
         <a href="admin_users.php">USERS</a>
         <a href="admin_contacts.php">MESSAGES</a>
         <a href="admin_tracking.php">TRACKING</a>
      </nav>

      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="user-btn" class="fas fa-user"></div>
      </div>

      <div class="profile">
         <?php if ($fetch_profile): ?>
            <img src="uploaded_img/<?= htmlspecialchars($fetch_profile['profile_picture']) ?>" alt="">
            <p><?= htmlspecialchars($fetch_profile['name']) ?></p>
            <a href="admin_update_profile.php" class="btn">update profile</a>
            <a href="logout.php" class="delete-btn">logout</a>
         <?php else: ?>
            <p>Admin not logged in</p>
            <a href="login.php" class="btn">login</a>
         <?php endif; ?>
      </div>

   </div>

</header>

<script>
   document.querySelector('#menu-btn').onclick = () => {
      document.querySelector('.header .navbar').classList.toggle('active');
   };

   const userBtn = document.querySelector('#user-btn');
   const profileBox = document.querySelector('.profile');

   userBtn.onclick = (e) => {
      e.stopPropagation();
      profileBox.classList.toggle('active');
   };

   document.addEventListener('click', () => {
      profileBox.classList.remove('active');
   });

   profileBox.onclick = (e) => e.stopPropagation();
</script>
