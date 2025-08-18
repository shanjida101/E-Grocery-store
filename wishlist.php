<?php
include 'config.php';
session_start();

$user_id = $_SESSION['user_id'] ?? 1;

// Delete single item
if (isset($_GET['delete'])) {
   $delete_id = $_GET['delete'];
   $delete_item = $conn->prepare("DELETE FROM wishlist WHERE id = ?");
   $delete_item->execute([$delete_id]);
   header('location:wishlist.php');
   exit;
}

// Delete all items
if (isset($_GET['delete_all'])) {
   $delete_all = $conn->prepare("DELETE FROM wishlist WHERE user_id = ?");
   $delete_all->execute([$user_id]);
   header('location:wishlist.php');
   exit;
}

// Add to cart
if (isset($_POST['add_to_cart'])) {
   $pid = $_POST['pid'];
   $p_name = $_POST['p_name'];
   $p_price = $_POST['p_price'];
   $p_image = $_POST['p_image'];
   $p_qty = $_POST['p_qty'];

   $check_cart = $conn->prepare("SELECT * FROM cart WHERE name = ? AND user_id = ?");
   $check_cart->execute([$p_name, $user_id]);

   if ($check_cart->rowCount() > 0) {
      $message[] = 'Already added to cart!';
   } else {
      $insert_cart = $conn->prepare("INSERT INTO cart (user_id, pid, name, price, quantity, image) VALUES (?, ?, ?, ?, ?, ?)");
      $insert_cart->execute([$user_id, $pid, $p_name, $p_price, $p_qty, $p_image]);
      $message[] = 'Added to cart!';
   }
}
?>
<?php include 'header.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <title>Wishlist</title>
   <link rel="stylesheet" href="css/home.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <style>
      body {
         font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
         margin: 0;
         padding: 0;
         background: linear-gradient(135deg, #ece9e6, #ffffff);
         color: #333;
      }

      .wishlist {
         padding: 50px 8%;
         max-width: 1200px;
         margin: auto;
      }

      .wishlist .title {
         font-size: 2.4rem;
         font-weight: 700;
         text-align: center;
         margin-bottom: 40px;
         color: #222;
         letter-spacing: 1px;
      }

      .wishlist-container {
         display: grid;
         grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
         gap: 25px;
      }

  .wishlist-card {
   background: rgba(255, 255, 255, 0.9);
   border-radius: 15px;
   box-shadow: 0 8px 20px rgba(0,0,0,0.1);
   overflow: hidden;
   transition: transform 0.3s ease, box-shadow 0.3s ease;
   display: flex;
   flex-direction: column;

   width: 320px;     
   min-height: 450px; 
   padding: 25px;    
}

      .wishlist-card:hover {
         transform: translateY(-8px);
         box-shadow: 0 12px 30px rgba(0,0,0,0.2);
      }
.wishlist-image {
   width: 200px;
   height: 200px;
   border-radius: 50%;
   overflow: hidden;   /* prevent overflow */
   margin: 0 auto;     /* center align */
   border: 3px solid #ddd; /* optional border */
   box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* optional shadow */
}

.wishlist-image img {
   width: 100%;
   height: 100%;
   object-fit: cover;  /* keep aspect ratio and crop properly */
   display: block;
}

      .wishlist-info {
         padding: 18px;
         text-align: center;
      }

      .wishlist-info h3 {
         font-size: 1.3rem;
         margin-bottom: 10px;
         color: #111;
      }

      .wishlist-info .price {
         color: #28a745;
         font-size: 1.2rem;
         margin-bottom: 15px;
         font-weight: bold;
      }

      .wishlist-form {
         display: flex;
         flex-direction: column;
         gap: 12px;
         align-items: center;
      }

      .wishlist-form .qty {
         width: 65px;
         text-align: center;
         padding: 6px;
         border: 1px solid #ccc;
         border-radius: 6px;
      }

      .btn {
         background: linear-gradient(135deg, #007bff, #0056b3);
         color: #fff;
         padding: 10px 18px;
         border: none;
         border-radius: 8px;
         cursor: pointer;
         font-size: 0.95rem;
         transition: transform 0.2s ease, background 0.3s;
      }

      .btn:hover {
         transform: scale(1.05);
         background: linear-gradient(135deg, #0056b3, #004080);
      }

      .delete-btn {
         background: linear-gradient(135deg, #dc3545, #a71d2a);
         color: white;
         padding: 8px 16px;
         border-radius: 8px;
         text-decoration: none;
         font-size: 0.9rem;
         transition: transform 0.2s ease, background 0.3s;
      }

      .delete-btn:hover {
         transform: scale(1.05);
         background: linear-gradient(135deg, #a71d2a, #721c24);
      }

      .delete-btn.disabled {
         opacity: 0.5;
         pointer-events: none;
      }

      .wishlist-total {
         margin-top: 40px;
         text-align: center;
         font-size: 1.3rem;
         font-weight: bold;
      }

      .wishlist-total span {
         color: #28a745;
         font-size: 1.6rem;
      }

      .option-btn {
         background: linear-gradient(135deg, #ffc107, #e0a800);
         color: black;
         padding: 10px 20px;
         border-radius: 8px;
         text-decoration: none;
         font-weight: 500;
         display: inline-block;
         margin: 12px;
         transition: transform 0.2s ease, background 0.3s;
      }

      .option-btn:hover {
         transform: scale(1.05);
         background: linear-gradient(135deg, #e0a800, #c69500);
      }

      .empty {
         text-align: center;
         font-size: 1.2rem;
         margin-top: 50px;
         color: #777;
      }
   </style>
</head>
<body>

<section class="wishlist">
   <h1 class="title">💖 Your Wishlist</h1>
   <div class="wishlist-container">
      <?php
      $grand_total = 0;
      $wishlist = $conn->prepare("SELECT * FROM wishlist WHERE user_id = ?");
      $wishlist->execute([$user_id]);

      if ($wishlist->rowCount() > 0):
         while ($item = $wishlist->fetch(PDO::FETCH_ASSOC)):
            $grand_total += $item['price'];
      ?>
      <div class="wishlist-card">
         <a href="view_page.php?pid=<?= $item['pid']; ?>" class="wishlist-image">
            <img src="uploaded_img/<?= htmlspecialchars(basename($item['image'])); ?>" 
                 alt="<?= htmlspecialchars($item['name']); ?>">
         </a>
         <div class="wishlist-info">
            <h3><?= htmlspecialchars($item['name']); ?></h3>
            <p class="price">৳<?= $item['price']; ?>/-</p>
            <form method="POST" class="wishlist-form">
               <input type="number" name="p_qty" min="1" value="1" class="qty">
               <input type="hidden" name="pid" value="<?= $item['pid']; ?>">
               <input type="hidden" name="p_name" value="<?= htmlspecialchars($item['name']); ?>">
               <input type="hidden" name="p_price" value="<?= $item['price']; ?>">
               <input type="hidden" name="p_image" value="<?= htmlspecialchars($item['image']); ?>">
               <input type="submit" name="add_to_cart" value="Add to Cart" class="btn">
               <a href="wishlist.php?delete=<?= $item['id']; ?>" class="delete-btn">Remove</a>
            </form>
         </div>
      </div>
      <?php endwhile; else: ?>
         <p class="empty">Your wishlist is empty 💔</p>
      <?php endif; ?>
   </div>

   <div class="wishlist-total">
      <p>Grand Total: <span>৳<?= $grand_total; ?>/-</span></p>
      <a href="shop.php" class="option-btn">⬅ Continue Shopping</a>
      <a href="wishlist.php?delete_all" class="delete-btn <?= ($grand_total > 0) ? '' : 'disabled'; ?>">🗑 Delete All</a>
   </div>
</section>

</body>
</html>
