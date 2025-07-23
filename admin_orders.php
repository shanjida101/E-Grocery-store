<?php
require_once 'config.php';

if (!isset($conn)) {
   die("❌ Database connection not established. Check config.php.");
}

session_start();

$admin_id = $_SESSION['admin_id'] ?? null;

if (!$admin_id) {
   header('location:login.php');
   exit();
}

// Update order status
if (isset($_POST['update_order'])) {
   $order_id = $_POST['order_id'];
   $update_payment = $_POST['update_payment'];
   $update_order = $conn->prepare("UPDATE `orders` SET payment_status = ? WHERE id = ?");
   $update_order->execute([$update_payment, $order_id]);
   header("Location: admin_orders.php");
   exit();
}

// Delete order
if (isset($_GET['delete'])) {
   $delete_id = $_GET['delete'];
   $delete_order = $conn->prepare("DELETE FROM `orders` WHERE id = ?");
   $delete_order->execute([$delete_id]);
   header('location:admin_orders.php');
   exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <title>Admin Orders</title>
   <link rel="stylesheet" href="css/admin_page.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.5.2/css/all.min.css">
   <style>
     /* Custom dropdown style */
select {
   padding: 8px 12px;
   border: 2px solid #2196f3;
   border-radius: 6px;
   font-size: 16px;
   background-color: #fff;
   color: #333;
   transition: border-color 0.3s ease, box-shadow 0.3s ease;
   outline: none;
   appearance: none;
   cursor: pointer;
   min-width: 140px;
}

/* Add a little arrow styling */
select:focus {
   border-color: #1976d2;
   box-shadow: 0 0 4px rgba(25, 118, 210, 0.6);
}

select:hover {
   border-color: #1976d2;
}

      .placed-orders {
         max-width: 1000px;
         margin: auto;
      }
      .title {
         text-align: center;
         margin-bottom: 30px;
         color: darkgreen;
      }
      .search-form input,
      .search-form select,
      .search-form button {
         padding: 8px;
         margin: 5px;
         border-radius: 5px;
         border: 1px solid #ccc;
      }
      .list-container {
         margin-top: 20px;
      }
      .order-row {
         background-color: #fdfdfd;
         border: 1px solid #ccc;
         padding: 12px;
         cursor: pointer;
         font-weight: bold;
         margin-bottom: 5px;
         border-radius: 6px;
         transition: background-color 0.2s;
      }
      .order-row:hover {
         background-color: #e9f5e9;
      }
      .order-details {
         background-color: #ffffff;
         border: 1px solid #ddd;
         padding: 15px;
         margin-bottom: 15px;
         border-radius: 5px;
         display: none;
      }
      .order-details form {
         margin-top: 10px;
      }
      .option-btn,
      .delete-btn {
         margin-top: 10px;
         padding: 6px 12px;
         border: none;
         border-radius: 4px;
         cursor: pointer;
      }
      .option-btn {
         background-color: #2196f3;
         color: white;
      }
      .delete-btn {
         background-color: #f44336;
         color: white;
         margin-left: 10px;
      }
   </style>
</head>
<body>
<?php include 'admin_header.php'; ?>
<section class="placed-orders">
   <h1 class="title">Placed Orders</h1>

   <!-- Search Form -->
   <form method="GET" class="search-form" style="text-align:center;">
      <input type="text" name="search_id" placeholder="Search by Order ID" value="<?= isset($_GET['search_id']) ? htmlspecialchars($_GET['search_id']) : '' ?>">
      <input type="text" name="user_id" placeholder="Search by User ID" value="<?= isset($_GET['user_id']) ? htmlspecialchars($_GET['user_id']) : '' ?>">
      <select name="status_filter">
         <option value="">All</option>
         <option value="pending" <?= (isset($_GET['status_filter']) && $_GET['status_filter'] === 'pending') ? 'selected' : '' ?>>Pending</option>
         <option value="completed" <?= (isset($_GET['status_filter']) && $_GET['status_filter'] === 'completed') ? 'selected' : '' ?>>Completed</option>
      </select>
      <button type="submit">Search</button>
   </form>

   <div class="list-container">
      <?php
         $query = "SELECT * FROM `orders` WHERE 1";
         $params = [];

         if (!empty($_GET['search_id'])) {
            $query .= " AND id = ?";
            $params[] = $_GET['search_id'];
         }

         if (!empty($_GET['user_id'])) {
            $query .= " AND user_id = ?";
            $params[] = $_GET['user_id'];
         }

         if (!empty($_GET['status_filter'])) {
            $query .= " AND payment_status = ?";
            $params[] = $_GET['status_filter'];
         }

         $select_orders = $conn->prepare($query);
         $select_orders->execute($params);

         if($select_orders->rowCount() > 0){
            while($order = $select_orders->fetch(PDO::FETCH_ASSOC)){
      ?>
      <div class="order-row" onclick="toggleDetails('details-<?= $order['id']; ?>')">
         <strong>Order #<?= $order['id']; ?></strong> — <?= htmlspecialchars($order['name']); ?> — <em><?= $order['payment_status']; ?></em>
      </div>

      <div class="order-details" id="details-<?= $order['id']; ?>">
         <p><strong>User ID:</strong> <?= $order['user_id']; ?></p>
         <p><strong>Placed On:</strong> <?= $order['placed_on']; ?></p>
         <p><strong>Email:</strong> <?= htmlspecialchars($order['email']); ?></p>
         <p><strong>Number:</strong> <?= $order['number']; ?></p>
         <p><strong>Address:</strong> <?= htmlspecialchars($order['address']); ?></p>
         <p><strong>Products:</strong> <?= htmlspecialchars($order['total_products']); ?></p>
         <p><strong>Total Price:</strong> ৳<?= $order['total_price']; ?>/-</p>
         <p><strong>Method:</strong> <?= $order['method']; ?></p>

         <form action="" method="POST">
            <input type="hidden" name="order_id" value="<?= $order['id']; ?>">
            <select name="update_payment">
               <option value="pending" <?= $order['payment_status'] == 'pending' ? 'selected' : '' ?>>Pending</option>
               <option value="completed" <?= $order['payment_status'] == 'completed' ? 'selected' : '' ?>>Completed</option>
            </select>
            <input type="submit" name="update_order" value="Update" class="option-btn">
            <a href="admin_orders.php?delete=<?= $order['id']; ?>" class="delete-btn" onclick="return confirm('Delete this order?')">Delete</a>
         </form>
      </div>
      <?php
            }
         } else {
            echo "<p class='empty'>No orders found!</p>";
         }
      ?>
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
