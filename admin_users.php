<?php

require_once 'config.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$admin_id = $_SESSION['admin_id'] ?? null;

if (!$admin_id) {
    header('location:login.php');
    exit();
}

// Delete admin (if requested)
if (isset($_GET['delete'])) {
    $delete_id = $_GET['delete'];
    $delete_user = $conn->prepare("DELETE FROM `users` WHERE id = ?");
    $delete_user->execute([$delete_id]);
    header('location:admin_users.php');
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <title>Admin Accounts</title>
   <link rel="stylesheet" href="css/admin_page.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <style>
      .admin-list {
         max-width: 800px;
         margin: 2rem auto;
         padding: 1rem;
      }
      .admin-card {
         background-color: #fdfdfd;
         border: 1px solid #ccc;
         padding: 15px;
         border-radius: 8px;
         margin-bottom: 10px;
         cursor: pointer;
         font-weight: bold;
         transition: background-color 0.2s;
      }
      .admin-card:hover {
         background-color: #e9f5e9;
      }
      .admin-details {
         display: none;
         background: #fff;
         padding: 15px;
         margin-top: 10px;
         border: 1px solid #ddd;
         border-radius: 6px;
      }
      .delete-btn {
         display: inline-block;
         background-color: #dc3545;
         color: white;
         padding: 6px 12px;
         border-radius: 5px;
         margin-top: 10px;
         text-decoration: none;
         transition: background 0.3s ease;
      }
      .delete-btn:hover {
         background-color: #c82333;
      }
      .title {
         text-align: center;
         font-size: 2.5rem;
         margin-top: 2rem;
         color: #333;
         text-transform: capitalize;
         position: relative;
      }

      .title::after {
         content: '';
         display: block;
         width: 60px;
         height: 3px;
         background: #28a745;
         margin: 0.6rem auto 0;
         border-radius: 10px;
      }
   </style>
</head>
<body>

<?php include 'admin_header.php'; ?>

<section class="user-accounts">
   <h1 class="title">Admin Accounts</h1>

   <div class="admin-list">
      <?php
         $select_admins = $conn->prepare("SELECT * FROM `users` WHERE user_type = 'admin'");
         $select_admins->execute();

         while($admin = $select_admins->fetch(PDO::FETCH_ASSOC)) {
      ?>
      <div class="admin-card" onclick="toggleDetails('admin-<?= $admin['id']; ?>')">
         <?= htmlspecialchars($admin['name']) ?> (ID: <?= $admin['id']; ?>)
      </div>
      <div class="admin-details" id="admin-<?= $admin['id']; ?>">
         <p><strong>User ID:</strong> <?= $admin['id']; ?></p>
         <p><strong>Name:</strong> <?= htmlspecialchars($admin['name']); ?></p>
         <p><strong>Email:</strong> <?= htmlspecialchars($admin['email']); ?></p>
         <a href="admin_users.php?delete=<?= $admin['id']; ?>" class="delete-btn" onclick="return confirm('Delete this admin?')">Delete</a>
      </div>
      <?php } ?>
   </div>
</section>

<script>
   function toggleDetails(id) {
      const elem = document.getElementById(id);
      elem.style.display = (elem.style.display === "none" || elem.style.display === "") ? "block" : "none";
   }
</script>

</body>
</html>
