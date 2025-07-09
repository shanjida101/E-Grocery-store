<?php
include 'config.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    header('location:login.php');
    exit();
}

$user_id = $_SESSION['user_id'];
$selected_status = $_GET['status'] ?? '';

// Build dynamic SQL
$query = "SELECT o.id AS order_id, o.placed_on, o.total_price,
    (SELECT status FROM order_tracking WHERE order_id = o.id ORDER BY updated_at DESC LIMIT 1) AS tracking_status
    FROM orders o
    WHERE o.user_id = :user_id";

$params = [':user_id' => $user_id];

if (!empty($selected_status)) {
    $query .= " HAVING tracking_status = :status";
    $params[':status'] = $selected_status;
}

$query .= " ORDER BY o.placed_on DESC";

$stmt = $conn->prepare($query);
$stmt->execute($params);
$orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <?php include 'user_header.php'; ?>

    <section class="orders">
        <h1 class="title">My Orders & Tracking</h1>

        <!-- Filter Dropdown -->
        <form method="GET" action="orders.php" class="filter-form">
            <label for="status">Filter by Status:</label>
            <select name="status" onchange="this.form.submit()">
                <option value="">All</option>
                <?php
                $statuses = ['Order Placed', 'Packed', 'Shipped', 'Out for Delivery', 'Delivered'];
                foreach ($statuses as $status) {
                    $selected = ($status === $selected_status) ? 'selected' : '';
                    echo "<option value=\"$status\" $selected>$status</option>";
                }
                ?>
            </select>
        </form>

        <!-- Order Table -->
        <table class="table">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Total</th>
                    <th>Tracking Status</th>
                </tr>
            </thead>
            <tbody>
                <?php if (count($orders) > 0): ?>
                    <?php foreach ($orders as $order): ?>
                        <tr>
                            <td>#<?= $order['order_id']; ?></td>
                            <td><?= $order['placed_on']; ?></td>
                            <td>৳<?= $order['total_price']; ?></td>
                            <td>
                                <span class="status <?= strtolower(str_replace(' ', '-', $order['tracking_status'] ?? 'Order Placed')) ?>">
                                    <?= $order['tracking_status'] ?? 'Order Placed'; ?>
                                </span>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr><td colspan="4">No orders found for this status.</td></tr>
                <?php endif; ?>
            </tbody>
        </table>
    </section>
</body>
</html>
