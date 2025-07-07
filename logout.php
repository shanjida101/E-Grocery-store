<?php
session_start();
// Load database configuration
include 'config.php';

    // Start a session to store user data across pages
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}


    session_unset(); // Unset all session variables
    // also destroy the session
    session_destroy();
header('Location: login.php'); // Redirect to login page
exit();