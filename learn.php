<?php

@include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
};

// learn.php
include 'header.php'; // if you have a header file
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>quick view</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/home.css">
   <link rel="stylesheet" href="css/view_page.css">

   <!-- Inline CSS for the Shop Now button -->
   <style>
      .btn-learn {
         display: inline-block;
         padding: 12px 28px;
         background: linear-gradient(135deg, #28a745, #218838);
         color: #fff;
         font-size: 18px;
         font-weight: bold;
         text-transform: uppercase;
         border-radius: 50px;
         text-decoration: none;
         box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
         transition: all 0.3s ease;
         letter-spacing: 1px;
      }
      .btn-learn:hover {
         background: linear-gradient(135deg, #218838, #1e7e34);
         transform: scale(1.1) translateY(-3px);
         box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
      }
   </style>
</head>
<body>
<div style="max-width: 900px; margin: 40px auto; padding: 20px; background: #fff; border-radius: 10px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <h1 style="text-align:center; color:#28a745;">About Our Vaggies Shop</h1>
    <p style="font-size: 18px; line-height: 1.6; text-align: justify; margin-top: 20px;">
        Welcome to our E-Grocery platform! We provide fresh vegetables, fruits, dairy, and daily essentials delivered right to your doorstep. 
        Our mission is to make grocery shopping simple, quick, and affordable for everyone. 
    </p>
    
    <h2 style="margin-top:30px; color:#333;">Why Choose Us?</h2>
    <ul style="font-size: 16px; line-height: 1.8; margin-left: 20px;">
        <li>Fresh and organic products directly from farmers.</li>
        <li>Affordable pricing with seasonal discounts.</li>
        <li>Fast delivery across the city.</li>
        <li>Easy online ordering and secure payment options.</li>
    </ul>

    <h2 style="margin-top:30px; color:#333;">Our Vision</h2>
    <p style="font-size: 16px; line-height: 1.6;">
        To become the most trusted online grocery provider in the region, ensuring that every family gets the best quality food while saving time and money.
    </p>

    <div style="text-align:center; margin-top: 30px;">
        <a href="shop.php" class="btn-learn">Shop Now</a>
    </div>
</div>

<?php
include 'footer.php'; // if you have a footer file
?>  ta tor code learn.php
