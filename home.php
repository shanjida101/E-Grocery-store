<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

@include 'config.php';

$user_id = $_SESSION['user_id'];

if (!$user_id) {
    header('Location: login.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin page</title>
</head>
<body>
<h1>Welcome to the User Page</h1>
<p>This page is accessible only to users.</p>  
<a href="logout.php">Logout</a>
</body>
</html>