<?php
@include 'config.php';
session_start();

$admin_id = $_SESSION['admin_id'];
if (!$admin_id) {
    header('location:login.php');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Admin Dashboard</title>
   <link rel="stylesheet" href="css/admin_page.css">
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<?php include 'admin_header.php'; ?>

<section class="dashboard">
   <h1 class="title">Dashboard</h1>

      <!-- TOP CHARTS ROW -->
 <div class="chart-container">
  <div class="chart-box">
     <h3>Reports</h3>
     <div class="chart-wrapper">
        <canvas id="reportChart"></canvas>
     </div>
  </div>

  <div class="chart-box">
     <h3>Analytics</h3>
     <div class="chart-wrapper">
        <canvas id="analyticsChart"></canvas>
     </div>
     <div style="text-align:center; margin-top:10px;">
        <span style="color:#4c84ff;">■ Sale</span>
        <span style="color:#fddc5c;">■ Distribute</span>
        <span style="color:#ff6b6b;">■ Return</span>
     </div>
  </div>
</div>


   <!-- STAT BOXES BELOW -->
   <div class="box-container">
      <?php
         function statBox($label, $count, $link, $buttonText) {
             echo "<div class='box'>
                    <h3>$count</h3>
                    <p>$label</p>
                    <a href='$link' class='btn'>$buttonText</a>
                   </div>";
         }

         $number_of_orders = $conn->query("SELECT * FROM `orders`")->rowCount();
         statBox('orders placed', $number_of_orders, 'admin_orders.php', 'see orders');

         $number_of_products = $conn->query("SELECT * FROM `products`")->rowCount();
         statBox('products added', $number_of_products, 'admin_products.php', 'see products');

         $number_of_users = $conn->query("SELECT * FROM `users` WHERE user_type = 'user'")->rowCount();
         statBox('total users', $number_of_users, 'users_account.php', 'see users');

         $number_of_admins = $conn->query("SELECT * FROM `users` WHERE user_type = 'admin'")->rowCount();
         statBox('total admins', $number_of_admins, 'admin_users.php', 'see admins');

         $number_of_accounts = $conn->query("SELECT * FROM `users`")->rowCount();
         statBox('total accounts', $number_of_accounts, 'users_account.php', 'see users');

         $number_of_messages = $conn->query("SELECT * FROM `message`")->rowCount();
         statBox('total messages', $number_of_messages, 'admin_contacts.php', 'see messages');
      ?>
   </div>
</section>

<!-- JS to Render Charts -->
<script>
fetch('fetch_chart_data.php')
   .then(res => res.json())
   .then(data => {
      const reportLabels = data.report.map(row => row.hour + ":00");
      const reportValues = data.report.map(row => row.total);

      new Chart(document.getElementById('reportChart'), {
         type: 'line',
         data: {
            labels: reportLabels,
            datasets: [{
               label: 'Revenue',
               data: reportValues,
               fill: true,
               backgroundColor: 'rgba(76,132,255,0.05)',
               borderColor: 'rgba(255,0,255,0.6)',
               tension: 0.4
            }]
         },
         options: {
            responsive: true,
            plugins: { legend: { display: false } }
         }
      });

      const analyticsLabels = data.analytics.map(row => row.order_status);
      const analyticsCounts = data.analytics.map(row => row.count);

      new Chart(document.getElementById('analyticsChart'), {
         type: 'doughnut',
         data: {
            labels: analyticsLabels,
            datasets: [{
               label: 'Transactions',
               data: analyticsCounts,
               backgroundColor: ['#4c84ff', '#fddc5c', '#ff6b6b'],
               borderWidth: 0
            }]
         },
         options: {
            cutout: '70%',
            plugins: {
               legend: { display: false },
               tooltip: { enabled: true }
            }
         }
      });
   });
</script>

</body>
</html>
