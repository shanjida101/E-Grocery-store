<?php
// admin_tracking.php

include 'config.php';
session_start();

if (!isset($_SESSION['admin_id'])) {
    header('location:login.php');
    exit();
}

// Fetch all orders with latest tracking status
$stmt = $conn->prepare("SELECT o.id AS order_id, o.user_id, o.placed_on, u.name, u.email,
    (SELECT status FROM order_tracking WHERE order_id = o.id ORDER BY updated_at DESC LIMIT 1) AS current_status
 FROM orders o
 JOIN users u ON o.user_id = u.id
 ORDER BY o.placed_on DESC");
$stmt->execute();
$orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Update Tracking</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <?php include 'admin_header.php'; ?>
    <section class="tracking">
        <h1 class="title">Update Order Tracking</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>User</th>
                    <th>Email</th>
                    <th>Placed On</th>
                    <th>Current Status</th>
                    <th>Update Status</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($orders as $order): ?>
                    <tr>
                        <td><?= $order['order_id']; ?></td>
                        <td><?= htmlspecialchars($order['name']); ?></td>
                        <td><?= htmlspecialchars($order['email']); ?></td>
                        <td><?= $order['placed_on']; ?></td>
                        <td><?= $order['current_status'] ?? 'Order Placed'; ?></td>
                        <td>
                            <form method="POST" action="update_tracking.php">
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
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </section>
</body>
</html>
