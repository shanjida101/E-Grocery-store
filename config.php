<?php
$db_name = 'mysql:host=localhost;dbname=shop_db;charset=utf8';
$db_user = 'root';
$db_pass = '';
try {
    $conn = new PDO($db_name, $db_user, $db_pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->exec("SET NAMES utf8mb4 COLLATE utf8mb4_general_ci");

} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}