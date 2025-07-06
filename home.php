<?php
session_start();
@include 'config.php';

$admin_id = $_SESSION['admin_id'] ;

if (!$admin_id) {
    header('Location: admin_page.php'); 
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
<h1>Welcome to the Admin Page</h1>
<p>This page is accessible only to administrators.</p>  
</body>
</html>