<?php
@include 'config.php';
session_start();

$admin_id = $_SESSION['admin_id'] ?? null;
if (!$admin_id) {
    header('location:login.php');
    exit();
}

if (!isset($_GET['update'])) {
    header('location:admin_products.php');
    exit();
}

$update_id = $_GET['update'];

// Fetch product details
$select_product = $conn->prepare("SELECT * FROM `products` WHERE id = ?");
$select_product->execute([$update_id]);
$fetch_product = $select_product->fetch(PDO::FETCH_ASSOC);

if (!$fetch_product) {
    echo "<p class='empty'>Product not found!</p>";
    exit();
}

$message = [];

// Handle update
if (isset($_POST['update_product'])) {
    $name = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
    $category = filter_var($_POST['category'], FILTER_SANITIZE_STRING);
    $details = filter_var($_POST['details'], FILTER_SANITIZE_STRING);
    $price = filter_var($_POST['price'], FILTER_SANITIZE_STRING);

    // Update main fields
    $update_query = $conn->prepare("UPDATE `products` SET name=?, category=?, details=?, price=? WHERE id=?");
    $update_query->execute([$name, $category, $details, $price, $update_id]);

    // Handle image update
    if (!empty($_FILES['image']['name'])) {
        $image = $_FILES['image']['name'];
        $image_tmp_name = $_FILES['image']['tmp_name'];
        $image_folder = 'uploaded_img/' . $image;
        $image_size = $_FILES['image']['size'];
        $old_image = $fetch_product['image'];

        if ($image_size > 2000000) {
            $message[] = 'Image size too large!';
        } else {
            $update_image = $conn->prepare("UPDATE `products` SET image=? WHERE id=?");
            $update_image->execute([$image, $update_id]);
            move_uploaded_file($image_tmp_name, $image_folder);

            if (!empty($old_image) && file_exists('uploaded_img/' . $old_image)) {
                unlink('uploaded_img/' . $old_image);
            }
        }
    }

    $message[] = 'Product updated successfully!';
    header("Location: admin_products.php?msg=updated");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <title>Update Product</title>
   <link rel="stylesheet" href="css/admin_page.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <style>
   body {
     background: #f4f6f9;
     font-family: 'Poppins', sans-serif;
   }

   .update-product {
     max-width: 650px;
     margin: 50px auto;
     padding: 30px;
     background: #ffffff;
     border-radius: 15px;
     box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
     transition: 0.3s ease-in-out;
   }

   .update-product:hover { transform: translateY(-3px); }

   .update-product .title {
     text-align: center;
     font-size: 28px;
     margin-bottom: 25px;
     font-weight: 600;
     color: #333;
     position: relative;
   }

   .update-product .title::after {
     content: "";
     display: block;
     width: 60px;
     height: 3px;
     background: #27ae60;
     margin: 10px auto 0;
     border-radius: 3px;
   }

   .update-product .box {
     width: 100%;
     padding: 12px 15px;
     margin: 12px 0;
     border: 1px solid #ddd;
     border-radius: 8px;
     outline: none;
     font-size: 15px;
     transition: 0.3s;
   }

   .update-product .box:focus {
     border-color: #27ae60;
     box-shadow: 0 0 5px rgba(39, 174, 96, 0.4);
   }

   .update-product textarea { resize: none; height: 120px; }

   .update-product img {
     display: block;
     margin: 0 auto 20px;
     border-radius: 10px;
     border: 2px solid #eee;
     max-height: 150px;
   }

   .flex-btn {
     display: flex;
     justify-content: space-between;
     margin-top: 20px;
   }

   .update-product .btn,
   .update-product .option-btn {
     display: inline-block;
     padding: 12px 20px;
     border-radius: 8px;
     text-decoration: none;
     font-size: 16px;
     font-weight: 500;
     transition: 0.3s ease-in-out;
     text-align: center;
   }

   .update-product .btn {
     background: #27ae60;
     color: #fff;
     border: none;
     cursor: pointer;
   }
   .update-product .btn:hover { background: #219150; }

   .update-product .option-btn {
     background: #eee;
     color: #333;
   }
   .update-product .option-btn:hover { background: #ddd; }

   @media (max-width: 768px) {
     .update-product { margin: 30px 15px; padding: 20px; }
     .flex-btn { flex-direction: column; gap: 10px; }
     .update-product .btn,
     .update-product .option-btn { width: 100%; }
   }

   /* Toast Notification */
   .toast {
     position: fixed;
     top: 20px;
     right: 20px;
     background: #27ae60;
     color: #fff;
     padding: 12px 20px;
     border-radius: 8px;
     box-shadow: 0 4px 10px rgba(0,0,0,0.15);
     opacity: 0;
     transform: translateY(-20px);
     transition: 0.3s ease-in-out;
     z-index: 9999;
   }
   .toast.show {
     opacity: 1;
     transform: translateY(0);
   }
   </style>
</head>
<body>

<?php include 'admin_header.php'; ?>

<section class="update-product">
   <h1 class="title">Update Product</h1>

   <form action="" method="POST" enctype="multipart/form-data">
      <img src="uploaded_img/<?= htmlspecialchars($fetch_product['image']); ?>" alt="Product Image">
      <input type="text" name="name" class="box" value="<?= htmlspecialchars($fetch_product['name']); ?>" required>
      <select name="category" class="box" required>
         <option value="vegetables" <?= ($fetch_product['category'] == 'vegetables') ? 'selected' : '' ?>>Vegetables</option>
         <option value="fruits" <?= ($fetch_product['category'] == 'fruits') ? 'selected' : '' ?>>Fruits</option>
         <option value="meat" <?= ($fetch_product['category'] == 'meat') ? 'selected' : '' ?>>Meat</option>
         <option value="fish" <?= ($fetch_product['category'] == 'fish') ? 'selected' : '' ?>>Fish</option>
      </select>
      <textarea name="details" class="box" required><?= htmlspecialchars($fetch_product['details']); ?></textarea>
      <input type="number" min="0" name="price" class="box" value="<?= $fetch_product['price']; ?>" required>
      <input type="file" name="image" class="box" accept="image/jpg, image/jpeg, image/png">
      <div class="flex-btn">
         <input type="submit" value="Update Product" name="update_product" class="btn">
         <a href="admin_products.php" class="option-btn">Go Back</a>
      </div>
   </form>
</section>

<!-- Toast -->
<div class="toast" id="toast">Product updated successfully!</div>

<script>
   // Show toast if redirected with msg
   const params = new URLSearchParams(window.location.search);
   if (params.get("msg") === "updated") {
       const toast = document.getElementById("toast");
       toast.classList.add("show");
       setTimeout(() => toast.classList.remove("show"), 3000);
   }
</script>

</body>
</html>
