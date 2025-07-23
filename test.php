<?php
include 'config.php';

$sql = "SELECT * FROM users";
$stmt = $conn->query($sql);

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo $row['name'] . "<br>";
}
?>
