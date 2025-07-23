<?php
include 'config.php';
session_start();

if (!isset($_SESSION['admin_id'])) {
    header('location:login.php');
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $order_id = $_POST['order_id'];
    $status = $_POST['tracking_status'];

    // Insert new tracking status
    $stmt = $conn->prepare("INSERT INTO order_tracking (order_id, status, updated_at) VALUES (?, ?, NOW())");
    $stmt->execute([$order_id, $status]);

    header('Location: admin_tracking.php');
    exit();
} else {
    header('Location: admin_tracking.php');
    exit();
}
