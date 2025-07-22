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
   <title>About Us</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/about.css">
</head>
<body>

<?php include 'header.php'; ?>

<section class="about">
   <h1 class="title">About Us</h1>
   <div class="row">

      <div class="box">
         <img src="uploaded_img/img-1.png" alt="Why choose us image">
         <h3>Why Choose Us?</h3>
         <p>We are committed to providing fresh and organic produce straight from the farm to your doorstep. Our focus on quality, affordability, and customer satisfaction sets us apart from the competition. Shop confidently with a trusted partner in healthy living.</p>
         <a href="contact.php" class="btn">Contact Us</a>
      </div>

      <div class="box">
         <img src="uploaded_img/img-2.png" alt="What we provide image">
         <h3>What We Provide?</h3>
         <p>Our e-grocery platform offers a wide variety of fresh fruits, vegetables, and  meat. We ensure hygienic packaging, timely delivery, and seamless online shopping experience with secure payment options.</p>
         <a href="shop.php" class="btn">Explore Shop</a>
      </div>

   </div>
</section>

<section class="reviews">
   <h1 class="title">Client Reviews</h1>

   <div class="box-container">

      <div class="box">
         <img src="uploaded_img/pic-1.png" alt="Customer 1">
         <p>Exceptional service and top-quality products. I always get my orders on time and in perfect condition!</p>
         <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
         </div>
         <h3>Miss</h3>
      </div>

      <div class="box">
         <img src="uploaded_img/pic-2.PNG" alt="Customer 2">
         <p>Shopping here has made my life easier. The variety is great and everything is fresh!</p>
         <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
         </div>
         <h3>Cool guy</h3>
      </div>

      <div class="box">
         <img src="uploaded_img/pic-3.png" alt="Customer 3">
         <p>Highly recommend this shop! I never have to worry about the quality of items I receive.</p>
         <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <i class="fas fa-star-half-alt"></i>
         </div>
         <h3>Taki</h3>
      </div>

      <div class="box">
         <img src="uploaded_img/pic-4.png" alt="Customer 4">
         <p>The customer service is friendly and responsive. I appreciate the personal touch and fast replies.</p>
         <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
         </div>
         <h3>Mitsuha</h3>
      </div>

   </div>
</section>

<?php include 'footer.php'; ?>

</body>
</html>
