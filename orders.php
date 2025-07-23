<?php

@include 'config.php';
session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Your Orders</title>

   <!-- Font Awesome -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- Custom CSS -->
   <link rel="stylesheet" href="css/home.css">
   <style>
      .placed-orders {
         padding: 40px 20px;
         background-color: #f4f6f8;
         min-height: 100vh;
      }

      .placed-orders .title {
         text-align: center;
         font-size: 2.5rem;
         margin-bottom: 30px;
         color: #333;
         font-weight: 700;
      }

      .placed-orders .box-container {
         display: grid;
         grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
         gap: 20px;
         max-width: 1200px;
         margin: 0 auto;
      }

      .placed-orders .box {
         background: #fff;
         border-radius: 12px;
         box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
         padding: 20px;
         transition: 0.3s;
      }

      .placed-orders .box:hover {
         transform: translateY(-5px);
      }

      .placed-orders .box p {
         font-size: 1rem;
         margin: 10px 0;
         color: #444;
         line-height: 1.4;
      }

      .placed-orders .box span {
         font-weight: 600;
         color: #000;
      }

      .placed-orders .box span.status {
         font-weight: bold;
         text-transform: uppercase;
         padding: 3px 8px;
         border-radius: 4px;
      }

      .placed-orders .box span.status.pending {
         color: #fff;
         background-color: #dc3545;
      }

      .placed-orders .box span.status.completed {
         color: #fff;
         background-color: #28a745;
      }

      .empty {
         text-align: center;
         font-size: 1.3rem;
         padding: 20px;
         color: #888;
      }

      @media (max-width: 500px) {
         .placed-orders .title {
            font-size: 2rem;
         }

         .placed-orders .box p {
            font-size: 0.95rem;
         }
      }
   </style>
</head>
<body>

<?php include 'header.php'; ?>

<section class="placed-orders">
   <h1 class="title">Your Orders</h1>

   <div class="box-container">
      <?php
         $select_orders = $conn->prepare("SELECT * FROM `orders` WHERE user_id = ?");
         $select_orders->execute([$user_id]);

         if($select_orders->rowCount() > 0){
            while($fetch_orders = $select_orders->fetch(PDO::FETCH_ASSOC)){ 
               $statusClass = $fetch_orders['payment_status'] == 'pending' ? 'pending' : 'completed';
      ?>
      <div class="box">
         <p><i class="fas fa-calendar-alt"></i> Placed on: <span><?= $fetch_orders['placed_on']; ?></span></p>
         <p><i class="fas fa-user"></i> Name: <span><?= $fetch_orders['name']; ?></span></p>
         <p><i class="fas fa-phone"></i> Number: <span><?= $fetch_orders['number']; ?></span></p>
         <p><i class="fas fa-envelope"></i> Email: <span><?= $fetch_orders['email']; ?></span></p>
         <p><i class="fas fa-map-marker-alt"></i> Address: <span><?= $fetch_orders['address']; ?></span></p>
         <p><i class="fas fa-money-check-alt"></i> Payment Method: <span><?= $fetch_orders['method']; ?></span></p>
         <p><i class="fas fa-box"></i> Your Orders: <span><?= $fetch_orders['total_products']; ?></span></p>
         <p><i class="fas fa-dollar-sign"></i> Total Price: <span>৳<?= $fetch_orders['total_price']; ?>/-</span></p>
         <p><i class="fas fa-info-circle"></i> Payment Status: <span class="status <?= $statusClass ?>"><?= $fetch_orders['payment_status']; ?></span></p>
      </div>
      <?php
            }
         } else {
            echo '<p class="empty">No orders placed yet!</p>';
         }
      ?>
   </div>
</section>

<?php include 'footer.php'; ?>

</body>
</html>
