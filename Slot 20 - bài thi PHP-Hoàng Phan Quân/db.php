<?php
$servername = "localhost:4307"; // Fixed the typo
$username = "your_username";
$password = "your_password";
$dbname = "employee_performance_db";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // echo "Connected successfully"; // Comment or remove this line
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>