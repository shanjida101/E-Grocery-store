<?php
@include 'config.php';
session_start();

$user_id = $_SESSION['user_id'] ?? null;
if (!$user_id) {
    header('location:login.php');
    exit;
}

// Fetch orders with latest status from order_tracking
$orders = $conn->prepare("
    SELECT o.*, 
           (SELECT status FROM order_tracking WHERE order_id = o.id ORDER BY updated_at DESC LIMIT 1) AS tracking_status
    FROM orders o
    WHERE o.user_id = ?
    ORDER BY o.placed_on DESC
");
$orders->execute([$user_id]);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Track Orders</title>
  <link rel="stylesheet" href="css/track_orders.css">
  <link rel="stylesheet" href="css/home.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>

<?php include 'header.php'; ?>

<section class="orders-section">
  <h2>Your Orders</h2>
  <div class="orders-container">
    <?php if ($orders->rowCount() > 0): ?>
      <?php while ($order = $orders->fetch(PDO::FETCH_ASSOC)): ?>
        <div class="order-card">
          <div class="order-header">
            <h3><i class="fas fa-box"></i> Order #<?= $order['id']; ?></h3>
            <span class="order-date"><?= date('d M Y, h:i A', strtotime($order['placed_on'])); ?></span>
          </div>

          <div class="order-info">
            <p><strong>Name:</strong> <?= htmlspecialchars($order['name']); ?></p>
            <p><strong>Address:</strong> <?= htmlspecialchars($order['address']); ?></p>
            <p><strong>Products:</strong> <?= htmlspecialchars($order['total_products']); ?></p>
            <p><strong>Total:</strong> ৳<?= number_format($order['total_price']); ?></p>
            <p><strong>Payment:</strong> <?= htmlspecialchars($order['method']); ?></p>
          </div>

          <!-- 🔵 TIMELINE -->
          <div class="timeline">
            <div class="timeline-step <?= ($order['tracking_status'] && in_array($order['tracking_status'], ['Order Placed','Packed','Shipped','Out for Delivery','Delivered'])) ? 'active' : '' ?>">
              <i class="fas fa-clipboard-check"></i>
              <span>Order Received</span>
            </div>

            <div class="timeline-step <?= ($order['tracking_status'] && in_array($order['tracking_status'], ['Packed','Shipped','Out for Delivery','Delivered'])) ? 'active' : '' ?>">
              <i class="fas fa-box-open"></i>
              <span>Preparing</span>
            </div>

            <div class="timeline-step <?= ($order['tracking_status'] && in_array($order['tracking_status'], ['Shipped','Out for Delivery','Delivered'])) ? 'active' : '' ?>">
              <i class="fas fa-truck"></i>
              <span>Shipped</span>
            </div>

            <div class="timeline-step <?= ($order['tracking_status'] && in_array($order['tracking_status'], ['Out for Delivery','Delivered'])) ? 'active' : '' ?>">
              <i class="fas fa-biking"></i>
              <span>Out for Delivery</span>
            </div>

            <div class="timeline-step <?= ($order['tracking_status'] == 'Delivered') ? 'active' : '' ?>">
              <i class="fas fa-check-circle"></i>
              <span>Delivered</span>
            </div>
          </div>
        </div>
      <?php endwhile; ?>
    <?php else: ?>
      <p class="empty">No orders found.</p>
    <?php endif; ?>
  </div>
</section>

<?php include 'footer.php'; ?>
</body>
</html>
