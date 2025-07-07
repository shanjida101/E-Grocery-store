<?php
session_start();
include 'config.php';

if (!isset($_SESSION['admin_id'])) {
    header('location:login.php');
    exit;
}

$admin_id = $_SESSION['admin_id'];

// Fetch admin profile safely
$select_profile = $conn->prepare("SELECT * FROM `users` WHERE id = ?");
$select_profile->execute([$admin_id]);
$fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);

if (!$fetch_profile) {
    die('Admin not found in the database.');
}

if (isset($_POST['update_profile'])) {
    $name = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
    $email = filter_var($_POST['email'], FILTER_SANITIZE_STRING);

    $update_profile = $conn->prepare("UPDATE `users` SET name = ?, email = ? WHERE id = ?");
    $update_profile->execute([$name, $email, $admin_id]);

    // Image Update
    $image = $_FILES['image']['name'];
    $image = filter_var($image, FILTER_SANITIZE_STRING);
    $image_size = $_FILES['image']['size'];
    $image_tmp_name = $_FILES['image']['tmp_name'];
    $image_folder = 'uploaded_img/' . $image;
    $old_image = $_POST['old_image'];

    if (!empty($image)) {
        if ($image_size > 2000000) {
            $message[] = 'Image size is too large!';
        } else {
            $update_image = $conn->prepare("UPDATE `users` SET profile_picture = ? WHERE id = ?");
            $update_image->execute([$image, $admin_id]);
            if ($update_image) {
                move_uploaded_file($image_tmp_name, $image_folder);
                if (file_exists('uploaded_img/' . $old_image)) {
                    unlink('uploaded_img/' . $old_image);
                }
                $message[] = 'Image updated successfully!';
            }
        }
    }

    // Password Update
    $old_pass = $_POST['old_pass'];
    $update_pass = md5($_POST['update_pass']);
    $new_pass = md5($_POST['new_pass']);
    $confirm_pass = md5($_POST['confirm_pass']);

    if (!empty($_POST['update_pass']) && !empty($_POST['new_pass']) && !empty($_POST['confirm_pass'])) {
        if ($update_pass !== $old_pass) {
            $message[] = 'Old password not matched!';
        } elseif ($new_pass !== $confirm_pass) {
            $message[] = 'Confirm password not matched!';
        } else {
            $update_pass_query = $conn->prepare("UPDATE `users` SET password = ? WHERE id = ?");
            $update_pass_query->execute([$confirm_pass, $admin_id]);
            $message[] = 'Password updated successfully!';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Update Admin Profile</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/admin_update_profile.css">
</head>
<body>
<?php include 'admin_header.php'; ?>


<section class="update-profile">
    
  <?php if (!empty($message)) {
   // If it's not already an array, convert it into one
   if (!is_array($message)) {
      $message = [$message];
   }

   foreach ($message as $msg) {
      echo '<div class="message"><span>' . $msg . '</span><i class="fas fa-times" onclick="this.parentElement.remove();"></i></div>';
   }
} ?>


   <form action="" method="POST" enctype="multipart/form-data">
      <img src="uploaded_img/<?= !empty($fetch_profile['profile_picture']) ? $fetch_profile['profile_picture'] : 'default.jpg'; ?>" alt="">
      <div class="flex">
         <div class="inputBox">
            <span>Username :</span>
            <input type="text" name="name" value="<?= $fetch_profile['name']; ?>" placeholder="Update username" required class="box">
            <span>Email :</span>
            <input type="email" name="email" value="<?= $fetch_profile['email']; ?>" placeholder="Update email" required class="box">
            <span>Update Picture :</span>
            <input type="file" name="image" accept="image/jpg, image/jpeg, image/png" class="box">
            <input type="hidden" name="old_image" value="<?= $fetch_profile['profile_picture']; ?>">
         </div>
         <div class="inputBox">
            <input type="hidden" name="old_pass" value="<?= $fetch_profile['password']; ?>">
            <span>Old Password :</span>
            <input type="password" name="update_pass" placeholder="Enter previous password" class="box">
            <span>New Password :</span>
            <input type="password" name="new_pass" placeholder="Enter new password" class="box">
            <span>Confirm Password :</span>
            <input type="password" name="confirm_pass" placeholder="Confirm new password" class="box">
         </div>
      </div>
      <div class="flex-btn">
         <input type="submit" class="btn" value="Update Profile" name="update_profile">
         <a href="admin_page.php" class="option-btn">Go Back</a>
      </div>
   </form>
</section>

</body>
</html>
