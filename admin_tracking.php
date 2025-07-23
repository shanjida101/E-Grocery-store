<?php
include 'config.php';
session_start();

if (!isset($_SESSION['admin_id'])) {
    header('location:login.php');
    exit();
}

// Fetch orders with latest tracking status
$stmt = $conn->prepare("
    SELECT o.id AS order_id, o.user_id, o.placed_on, o.name, o.email, o.total_price, o.total_products,
           (SELECT status FROM order_tracking WHERE order_id = o.id ORDER BY updated_at DESC LIMIT 1) AS current_status
    FROM orders o
    ORDER BY o.placed_on DESC
");
$stmt->execute();
$orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Delivery Tracking</title>
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="css/admin_page.css">
    <style>
        .tracking-container {
            max-width: 1000px;
            margin: auto;
            padding: 20px;
        }
        .order-box {
            background: #f9f9f9;
            border: 1px solid #ccc;
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 8px;
        }
        .order-box h3 {
            margin-bottom: 10px;
        }
        .tracking-form select, .tracking-form button {
            padding: 6px 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<?php include 'admin_header.php'; ?>

<section class="tracking-container">
    <h2 style="text-align: center;">Delivery Tracking Panel</h2>

    <?php foreach ($orders as $order): ?>
        <div class="order-box">
            <h3>Order #<?= $order['order_id']; ?> — <?= htmlspecialchars($order['name']); ?> —
                <em><?= $order['current_status'] ?? 'Order Placed'; ?></em>
            </h3>
            <p><strong>Email:</strong> <?= htmlspecialchars($order['email']); ?></p>
            <p><strong>Placed On:</strong> <?= $order['placed_on']; ?></p>
            <p><strong>Products:</strong> <?= htmlspecialchars($order['total_products']); ?></p>
            <p><strong>Total Price:</strong> ৳<?= $order['total_price']; ?>/-</p>

            <form class="tracking-form" method="POST" action="update_tracking.php">
                <input type="hidden" name="order_id" value="<?= $order['order_id']; ?>">
                <label>Update Status:</label>
                <select name="tracking_status" required>
                    <option value="">Select status</option>
                    <option>Order Placed</option>
                    <option>Packed</option>
                    <option>Shipped</option>
                    <option>Out for Delivery</option>
                    <option>Delivered</option>
                </select>
                <button type="submit" class="btn">Update</button>
            </form>
        </div>
    <?php endforeach; ?>
</section>

</body>
</html>
