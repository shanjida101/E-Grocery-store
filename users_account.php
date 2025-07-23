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

// Handle deletion
if (isset($_GET['delete'])) {
    $delete_id = $_GET['delete'];
    $delete_user = $conn->prepare("DELETE FROM `users` WHERE id = ?");
    $delete_user->execute([$delete_id]);
    header('location:user_accounts.php');
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <title>User Accounts</title>
   <link rel="stylesheet" href="css/admin_page.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <style>
      .user-list {
         max-width: 800px;
         margin: 2rem auto;
         padding: 1rem;
      }

      .search-form {
         text-align: center;
         margin-bottom: 20px;
      }

      .search-form input[type="text"],
      .search-form button {
         padding: 8px 12px;
         border-radius: 5px;
         border: 1px solid #ccc;
         font-size: 1rem;
         margin: 0 5px;
      }

      .user-card {
         background-color: #fdfdfd;
         border: 1px solid #ccc;
         padding: 15px;
         border-radius: 8px;
         margin-bottom: 10px;
         cursor: pointer;
         font-weight: bold;
         transition: background-color 0.2s, transform 0.2s;
      }

      .user-card:hover {
         background-color: #e9f5e9;
         transform: scale(1.01);
      }

      .user-details {
         display: none;
         background: #fff;
         padding: 15px 20px;
         margin-bottom: 20px;
         border: 1px solid #ddd;
         border-radius: 6px;
         color: #444;
         box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
      }

      .user-details p {
         margin: 10px 0;
         font-size: 1rem;
      }

      .delete-btn {
         display: inline-block;
         background-color: #dc3545;
         color: white;
         padding: 0.6rem 1.2rem;
         border-radius: 0.5rem;
         font-size: 1rem;
         text-decoration: none;
         transition: background 0.3s ease;
      }

      .delete-btn:hover {
         background-color: #c82333;
      }

      .title {
         text-align: center;
         font-size: 2.5rem;
         margin-top: 1rem;
         margin-bottom: 1.5rem;
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
   <h1 class="title">User Accounts</h1>

   <!-- 🔍 Search Form -->
   <form method="GET" class="search-form">
      <input type="text" name="search_id" placeholder="Search by User ID" value="<?= isset($_GET['search_id']) ? htmlspecialchars($_GET['search_id']) : '' ?>">
      <button type="submit">Search</button>
   </form>

   <div class="user-list">
      <?php
         $query = "SELECT * FROM `users` WHERE user_type = 'user'";
         $params = [];

         if (!empty($_GET['search_id'])) {
            $query .= " AND id = ?";
            $params[] = $_GET['search_id'];
         }

         $stmt = $conn->prepare($query);
         $stmt->execute($params);

         if ($stmt->rowCount() > 0) {
            while ($user = $stmt->fetch(PDO::FETCH_ASSOC)) {
      ?>
      <div class="user-card" onclick="toggleDetails('user-<?= $user['id']; ?>')">
         <?= htmlspecialchars($user['name']) ?> (ID: <?= $user['id']; ?>)
      </div>
      <div class="user-details" id="user-<?= $user['id']; ?>">
         <p><strong>User ID:</strong> <?= $user['id']; ?></p>
         <p><strong>Name:</strong> <?= htmlspecialchars($user['name']); ?></p>
         <p><strong>Email:</strong> <?= htmlspecialchars($user['email']); ?></p>
         <a href="user_accounts.php?delete=<?= $user['id']; ?>" class="delete-btn" onclick="return confirm('Delete this user?')">Delete</a>
      </div>
      <?php
            }
         } else {
            echo "<p style='text-align:center;'>No user accounts found.</p>";
         }
      ?>
   </div>
</section>

<script>
   function toggleDetails(id) {
      const el = document.getElementById(id);
      el.style.display = (el.style.display === "none" || el.style.display === "") ? "block" : "none";
   }
</script>

</body>
</html>
