<?php
$db_name = 'mysql:host=localhost;dbname=shop_db;charset=utf8';
$db_user = 'root';
$db_pass = '';
try {
    $conn = new PDO($db_name, $db_user, $db_pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}