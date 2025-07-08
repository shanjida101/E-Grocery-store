<?php
@include 'config.php';

// Reports: total_price grouped by hour from order_time
$report_stmt = $conn->prepare("SELECT HOUR(order_time) AS hour, SUM(total_price) AS total FROM orders GROUP BY hour ORDER BY hour ASC");
$report_stmt->execute();
$report_data = $report_stmt->fetchAll(PDO::FETCH_ASSOC);

// Analytics: count grouped by order_status (sale, distribute, return)
$analytics_stmt = $conn->prepare("SELECT order_status, COUNT(*) AS count FROM orders GROUP BY order_status");
$analytics_stmt->execute();
$analytics_data = $analytics_stmt->fetchAll(PDO::FETCH_ASSOC);

// Return both datasets as JSON
echo json_encode([
    "report" => $report_data,
    "analytics" => $analytics_data
]);
