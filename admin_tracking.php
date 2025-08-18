<?php
include 'config.php';
session_start();

if (!isset($_SESSION['admin_id'])) {
    header('location:login.php');
    exit();
}

// 🔎 Handle search query
$search = $_GET['search'] ?? '';
$searchBy = $_GET['search_by'] ?? 'order_id';

$allowedColumns = ['order_id' => 'o.id', 'user_id' => 'o.user_id', 'name' => 'o.name'];
$column = $allowedColumns[$searchBy] ?? 'o.id';

$query = "
    SELECT o.id AS order_id, o.user_id, o.placed_on, o.name, o.email, 
           o.total_price, o.total_products,
           (SELECT status 
            FROM order_tracking 
            WHERE order_id = o.id 
            ORDER BY updated_at DESC LIMIT 1) AS current_status
    FROM orders o
    WHERE $column LIKE :search
    ORDER BY o.placed_on DESC
";

$stmt = $conn->prepare($query);
$stmt->execute(['search' => "%$search%"]);
$orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>  Order Tracking</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.5.2/css/all.min.css">
  <link rel="stylesheet" href="css/admin_page.css">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, sans-serif;
      background: #f3f4f6;
      margin: 0;
    }
    .container {
      max-width: 1200px;
      margin: 40px auto;
      padding: 20px;
    }
    h2 {
      font-size: 28px;
      font-weight: 700;
      margin-bottom: 20px;
      color: #111827;
    }
    /* Search Bar */
    .search-bar {
      display: flex;
      justify-content: flex-end;
      margin-bottom: 20px;
      gap: 10px;
      flex-wrap: wrap;
    }
    .search-bar select,
    .search-bar input {
      padding: 10px 12px;
      border: 1px solid #d1d5db;
      border-radius: 8px;
      outline: none;
      font-size: 14px;
      background: #fff;
      transition: 0.2s;
    }
    .search-bar input:focus {
      border-color: #6366f1;
      box-shadow: 0 0 0 2px rgba(99,102,241,0.3);
    }
    .search-bar button {
      background: #6366f1;
      color: #fff;
      border: none;
      padding: 10px 16px;
      border-radius: 8px;
      cursor: pointer;
      font-size: 14px;
      font-weight: 600;
      transition: 0.2s;
    }
    .search-bar button:hover {
      background: #4f46e5;
    }
    /* Table */
    table {
      width: 100%;
      border-collapse: collapse;
      background: #fff;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 6px 14px rgba(0,0,0,0.05);
    }
    table th, table td {
      padding: 14px 16px;
      text-align: left;
      font-size: 14px;
    }
    table th {
      background: #f9fafb;
      font-weight: 700;
      color: #374151;
      border-bottom: 1px solid #e5e7eb;
    }
    table tbody tr {
      border-bottom: 1px solid #f3f4f6;
      transition: background 0.2s;
    }
    table tbody tr:hover {
      background: #f9fafb;
    }
    /* Status Badges */
    .badge {
      padding: 6px 12px;
      border-radius: 20px;
      font-size: 13px;
      font-weight: 600;
      display: inline-block;
    }
    .pending { background: #fef3c7; color: #92400e; }
    .success { background: #d1fae5; color: #065f46; }
    .unfulfilled { background: #fee2e2; color: #991b1b; }
    .fulfilled { background: #dcfce7; color: #166534; }

    /* Actions */
    .action-buttons {
      display: flex;
      gap: 10px;
      flex-wrap: wrap;
    }
    .action-buttons form {
      margin: 0;
    }
    .update-form select {
      padding: 6px 10px;
      border: 1px solid #d1d5db;
      border-radius: 6px;
    }
    .update-form button {
      background: #10b981;
      color: #fff;
      border: none;
      padding: 6px 12px;
      border-radius: 6px;
      cursor: pointer;
      font-size: 13px;
      transition: 0.2s;
    }
    .update-form button:hover {
      background: #059669;
    }
    .delete-form button {
      background: #ef4444;
      color: #fff;
      border: none;
      padding: 6px 12px;
      border-radius: 6px;
      cursor: pointer;
      font-size: 13px;
      transition: 0.2s;
    }
    .delete-form button:hover {
      background: #dc2626;
    }
    .empty {
      text-align: center;
      font-size: 16px;
      color: #6b7280;
      margin-top: 30px;
    }
    /* Responsive */
    @media(max-width: 768px) {
      table th, table td {
        padding: 10px 8px;
        font-size: 12px;
      }
      .action-buttons {
        flex-direction: column;
      }
    }
  </style>
</head>
<body>
  <?php include 'admin_header.php'; ?>

  <div class="container">
    <h2> Order Tracking</h2>

    <div class="search-bar">
      <form method="GET">
        <select name="search_by">
          <option value="order_id" <?= $searchBy === 'order_id' ? 'selected' : '' ?>>Order ID</option>
          <option value="user_id" <?= $searchBy === 'user_id' ? 'selected' : '' ?>>User ID</option>
          <option value="name" <?= $searchBy === 'name' ? 'selected' : '' ?>>Customer Name</option>
        </select>
        <input type="text" name="search" placeholder="🔍 Search orders..." value="<?= htmlspecialchars($search) ?>">
        <button type="submit">Search</button>
      </form>
    </div>

    <?php if ($orders): ?>
      <table>
        <thead>
          <tr>
            <th>Order</th>
            <th>Date</th>
            <th>Customer</th>
            <th>Email</th>
            <th>Total</th>
            <th>Items</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($orders as $order): ?>
            <tr>
              <td>#<?= $order['order_id']; ?></td>
              <td><?= date("d M Y", strtotime($order['placed_on'])); ?></td>
              <td><?= htmlspecialchars($order['name']); ?></td>
              <td><?= htmlspecialchars($order['email']); ?></td>
              <td>৳<?= number_format($order['total_price']); ?></td>
              <td><?= $order['total_products']; ?> items</td>
              <td>
                <?php
                  $status = $order['current_status'] ?? 'Order Placed';
                  $class = match($status) {
                    'Delivered' => 'fulfilled',
                    'Shipped', 'Packed', 'Out for Delivery' => 'success',
                    'Order Placed' => 'pending',
                    default => 'unfulfilled'
                  };
                ?>
                <span class="badge <?= $class; ?>"><?= $status; ?></span>
              </td>
              <td>
                <div class="action-buttons">
                  <form class="update-form" method="POST" action="update_tracking.php">
                    <input type="hidden" name="order_id" value="<?= $order['order_id']; ?>">
                    <select name="tracking_status" required>
                      <option value="">Select</option>
                      <option>Order Placed</option>
                      <option>Packed</option>
                      <option>Shipped</option>
                      <option>Out for Delivery</option>
                      <option>Delivered</option>
                    </select>
                    <button type="submit">Update</button>
                  </form>

                  <form class="delete-form" method="POST" action="delete_order.php" onsubmit="return confirm('Are you sure you want to delete this order?');">
                    <input type="hidden" name="order_id" value="<?= $order['order_id']; ?>">
                    <button type="submit">Delete</button>
                  </form>
                </div>
              </td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    <?php else: ?>
      <p class="empty">No orders found.</p>
    <?php endif; ?>
  </div>
</body>
</html>
