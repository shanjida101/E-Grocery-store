<?php
// update_tracking.php

include 'config.php';
session_start();

if (!isset($_SESSION['admin_id'])) {
    header('location:login.php');
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['order_id'], $_POST['tracking_status'])) {
    $order_id = intval($_POST['order_id']);
    $status = htmlspecialchars($_POST['tracking_status']);
    $updated_by = 'admin_' . $_SESSION['admin_id'];

    try {
        $stmt = $conn->prepare("INSERT INTO order_tracking (order_id, status, updated_by) VALUES (:order_id, :status, :updated_by)");
        $stmt->execute([
            ':order_id' => $order_id,
            ':status' => $status,
            ':updated_by' => $updated_by
        ]);

        $_SESSION['message'] = 'Tracking status updated successfully!';
    } catch (PDOException $e) {
        $_SESSION['error'] = 'Error updating status: ' . $e->getMessage();
    }
}

header('Location: admin_tracking.php');
exit();
