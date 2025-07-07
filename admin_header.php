<?php

if(isset($message)){
   foreach($message as $message){
      echo '
      <div class="message">
         <span>'.$message.'</span>
         <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
      ';
   }
}

?>

<header class="header">

   <div class="flex">

      <a href="admin_page.php" class="logo">Admin<span>Panel</span></a>

      <nav class="navbar">
         <a href="admin_page.php">home</a>
         <a href="admin_products.php">products</a>
         <a href="admin_orders.php">orders</a>
         <a href="admin_users.php">users</a>
         <a href="admin_contacts.php">messages</a>
      </nav>

      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="user-btn" class="fas fa-user"></div>
      </div>

      <div class="profile">
         <?php
            $select_profile = $conn->prepare("SELECT * FROM `users` WHERE id = ?");
            $select_profile->execute([$admin_id]);
            $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
         ?>
         <img src="uploaded_img/<?= $fetch_profile['profile_picture']; ?>" alt="">
         <p><?= $fetch_profile['name']; ?></p>
         <a href="admin_update_profile.php" class="btn">update profile</a>
         <a href="logout.php" class="delete-btn">logout</a>
        
      </div>

   </div>

</header>

 <script>
    let navbar = document.querySelector('.header .navbar');
    let menuBtn = document.querySelector('#menu-btn').onclick = () => {
        navbar.classList.toggle('active');
    }
    
 
   let userBtn = document.querySelector('#user-btn');
   let profileBox = document.querySelector('.profile');

   userBtn.onclick = (e) => {
      e.stopPropagation();
      profileBox.classList.toggle('active');
   };

   document.addEventListener('click', () => {
      profileBox.classList.remove('active');
   });

   profileBox.addEventListener('click', (e) => {
      e.stopPropagation(); // Prevent auto-close when clicking inside the box
   });
</script>
