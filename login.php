<?php
session_start();
include 'config.php';

// Only start session if not already started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = trim($_POST['email']);
    $email = filter_var($email, FILTER_SANITIZE_EMAIL);

    $password = trim($_POST['password']);

    // Check for empty fields
    if (empty($email) || empty($password)) {
        header('Location: login.php?error=Please fill in all fields');
        exit();
    }

    // Strong password validation (server-side)
    if (!preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/', $password)) {
        header('Location: login.php?error=Password must be at least 8 characters long and include uppercase, lowercase, digit, and special character.');
        exit();
    }

    // Check user by email
    $select = $conn->prepare("SELECT * FROM users WHERE email = ?");
    $select->execute([$email]);

    if ($select->rowCount() > 0) {
        $row = $select->fetch(PDO::FETCH_ASSOC);

        if (password_verify($password, $row['password'])) {
            $_SESSION['user_id'] = $row['id'];

            if ($row['user_type'] === 'admin') {
                $_SESSION['admin_id'] = $row['id'];
                header('Location: admin_page.php');
            } else {
                header('Location: home.php?success=Logged in successfully');
            }
            exit();
        } else {
            header('Location: login.php?error=Incorrect password');
            exit();
        }
    } else {
        header('Location: login.php?error=No user found with this email');
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Log In</title>
  <link rel="stylesheet" href="css/login.css" />
</head>
<body>

<form action="login.php" method="POST" novalidate>

<?php if (isset($_GET['success'])): ?>
  <div class="message success" id="success-message">
    <?= htmlspecialchars($_GET['success']) ?>
  </div>
<?php endif; ?>

<?php if (isset($_GET['error'])): ?>
  <div class="message error" id="error-message">
    <?= htmlspecialchars($_GET['error']) ?>
  </div>
<?php endif; ?>

  <h1>Log In</h1>

  <label for="email">Email:</label>
  <input type="email" id="email" name="email" class="form-control" required
         value="<?= isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '' ?>"><br><br>

  <label for="password">Password:</label>
  <input type="password" id="password" name="password" class="form-control" required><br><br>

  <input type="submit" value="Log In">

  <p>Don't have an account? <a href="register.php">Register here</a></p>
</form>

<script>
  const successMsg = document.getElementById('success-message');
  const errorMsg = document.getElementById('error-message');

  if (window.location.search.includes('error=') || window.location.search.includes('success=')) {
    const url = new URL(window.location);
    url.searchParams.delete('error');
    url.searchParams.delete('success');
    window.history.replaceState({}, document.title, url.pathname + url.search);
  }

  setTimeout(() => {
    if (successMsg) successMsg.style.display = 'none';
    if (errorMsg) errorMsg.style.display = 'none';
  }, 3000);

  // ✅ Client-side password validation
  document.querySelector('form').addEventListener('submit', function (e) {
    const password = document.getElementById('password').value;
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    if (!passwordRegex.test(password)) {
      alert("Password must be at least 8 characters and include uppercase, lowercase, digit, and special character.");
      e.preventDefault();
    }
  });
</script>

</body>
</html>
