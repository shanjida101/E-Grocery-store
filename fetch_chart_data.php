<?php
@include 'config.php';

// ---------------- REPORT (Revenue by Hour - with return) ----------------
$report = $conn->query("
   SELECT 
      HOUR(placed_on) AS hour, 
      SUM(total_price) AS total,
      payment_status
   FROM orders
   WHERE DATE(placed_on) = CURDATE()   -- today only
   GROUP BY HOUR(placed_on), payment_status
   ORDER BY hour
")->fetchAll(PDO::FETCH_ASSOC);

// If no real data, return dummy chart values
if (empty($report)) {
   $report = [
      ["hour" => 9, "total" => 1500, "payment_status" => "completed"],
      ["hour" => 11, "total" => 2200, "payment_status" => "pending"],
      ["hour" => 13, "total" => 1200, "payment_status" => "return"],
      ["hour" => 15, "total" => 3000, "payment_status" => "completed"],
      ["hour" => 18, "total" => 2700, "payment_status" => "return"]
   ];
}

// ---------------- ANALYTICS (Map payment_status → order_status) ----------------
$analytics_raw = $conn->query("
   SELECT 
      payment_status, 
      COUNT(*) AS count
   FROM orders
   GROUP BY payment_status
")->fetchAll(PDO::FETCH_ASSOC);

$analytics = [
   ["order_status" => "Sale", "count" => 0],
   ["order_status" => "Distribute", "count" => 0],
   ["order_status" => "Return", "count" => 0]
];

foreach ($analytics_raw as $row) {
   if ($row['payment_status'] === 'completed') {
      $analytics[0]["count"] = $row['count']; // Sale
   } elseif ($row['payment_status'] === 'pending') {
      $analytics[1]["count"] = $row['count']; // Distribute
   } elseif ($row['payment_status'] === 'return') {
      $analytics[2]["count"] = $row['count']; // Return
   }
}

// Return JSON
echo json_encode([
   "report" => $report,
   "analytics" => $analytics
]);
?>
