<?php
session_start();
// Load database configuration
include 'config.php';

// Start a session to store user data across pages
session_start();

// Handle form submission (POST request)
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Sanitize and retrieve email and password from the form
    $email = trim($_POST['email']);
    $email = filter_var($email, FILTER_SANITIZE_EMAIL);

    $password = trim($_POST['password']);
    $password = filter_var($password, FILTER_SANITIZE_STRING);

    // Check if fields are empty
    if (empty($email) || empty($password)) {
        header('Location: login.php?error=Please fill in all fields');
        exit();
    }

    // Check if user with this email exists
    $select = $conn->prepare("SELECT * FROM users WHERE email = ?");
    $select->execute([$email]);

    if ($select->rowCount() > 0) {
        $row = $select->fetch(PDO::FETCH_ASSOC);

        // Verify hashed password
        if (password_verify($password, $row['password'])) {
            // Save user ID in session
            $_SESSION['user_id'] = $row['id'];

            // Redirect based on user type
            if ($row['user_type'] === 'admin') {
                $_SESSION['admin_id'] = $row['id']; // ✅ Set session variable
                header('Location: admin_page.php');
                exit();
            } elseif ($row['user_type'] === 'user') {
                header('Location: home.php?success=Logged in successfully');
                exit();
            } else {
                header('Location: login.php?error=Unknown user type');
                exit();
            }
        } else {
            // Password does not match
            header('Location: login.php?error=Incorrect password');
            exit();
        }
    } else {
        // No user with this email
        header('Location: login.php?error=No user found with this email');
        exit();
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>


<form action="login.php" method="POST" novalidate>

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


    <h1>Log In</h1>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required
        value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>"><br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required><br><br>

    <input type="submit" value="Log In">

    <p>Don't have an account? <a href="register.php">Register here</a></p>
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
        }, 3000);
    }
</script>
</body>
</html>

