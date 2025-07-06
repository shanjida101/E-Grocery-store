<?php
include 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $password = filter_var($_POST['password'], FILTER_SANITIZE_STRING);

    if ($password !== $_POST['confirm_password']) {
        header("Location: register.php?error=Passwords do not match");
        exit();
    }

    $confirm_password = $_POST['confirm_password'];

    $profile_picture = $_FILES['profile_picture']['name'];
    $profile_picture_size = $_FILES['profile_picture']['size'];
    $profile_picture_tmp = $_FILES['profile_picture']['tmp_name'];
    $profile_picture_folder = 'uploads/' . $profile_picture;

    $select = $conn->prepare("SELECT * FROM `users` WHERE email = ?");
    $select->execute([$email]);

    if ($select->rowCount() > 0) {
        header("Location: register.php?error=User already exists");
        exit();
    } elseif ($profile_picture_size > 2000000) {
        header("Location: register.php?error=Profile picture size is too large");
        exit();
    } else {
        $insert = $conn->prepare("INSERT INTO `users` (name, email, password, profile_picture) VALUES (?, ?, ?, ?)");
        $insert->execute([$name, $email, password_hash($password, PASSWORD_DEFAULT), $profile_picture]);
        move_uploaded_file($profile_picture_tmp, $profile_picture_folder);
        header("Location: register.php?success=Registration successful");
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/component.css">
</head>
<body>

<?php if (isset($_GET['success'])): ?>
    <div class="message success" id="success-message">
        <?php echo htmlspecialchars($_GET['success']); ?>
    </div>
<?php endif; ?>

<?php if (isset($_GET['error'])): ?>
    <div class="message error" id="error-message">
        <?php echo htmlspecialchars($_GET['error']); ?>
    </div>
<?php endif; ?>

<form action="register.php" enctype="multipart/form-data" method="POST" novalidate>

    <h1>Register</h1>

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" class="form-control" placeholder="Enter your name" required
        value="<?php echo isset($_POST['name']) ? htmlspecialchars($_POST['name']) : ''; ?>"><br><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required
        value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>"><br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required><br><br>

    <label for="confirm_password">Confirm Password:</label>
    <input type="password" id="confirm_password" name="confirm_password" class="form-control" placeholder="Confirm your password" required><br><br>

    <label for="profile_picture">Profile Picture:</label>
    <input type="file" name="profile_picture" class="form-control" accept="image/png, image/jpeg, image/jpg"><br><br>

    <input type="submit" value="Register">

    <p>Already have an account? <a href="login.php">Login here</a></p>
</form>

<script>
    const successMsg = document.getElementById('success-message');
    const errorMsg = document.getElementById('error-message');

    // Clean the URL of query params
    if (window.location.search.includes('error=') || window.location.search.includes('success=')) {
        const url = new URL(window.location);
        url.searchParams.delete('error');
        url.searchParams.delete('success');
        window.history.replaceState({}, document.title, url.pathname + url.search);
    }

    // Hide messages after 3 seconds
    setTimeout(() => {
        if (successMsg) successMsg.style.display = 'none';
        if (errorMsg) errorMsg.style.display = 'none';
    }, 3000);

    // Redirect to login page if registration is successful
    if (successMsg) {
        setTimeout(() => {
            window.location.href = "login.php";
        }, 1000);
    }
</script>

</body>
</html>
