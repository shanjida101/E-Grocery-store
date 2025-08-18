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
    header('location:admin_products.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>products</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/admin_page.css">

</head>

<?php include 'admin_header.php'; ?>

<section class="update-product">
   <h1 class="title">Update Product</h1>

   <form action="" method="POST" enctype="multipart/form-data">
      <img src="uploaded_img/<?= htmlspecialchars($fetch_product['image']); ?>" height="100" alt="">
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

</body>
</html>
