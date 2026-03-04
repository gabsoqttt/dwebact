<?php
declare(strict_types = 1);

$type     = 'mysql';
$server   = 'localhost';
$db       = 'digicourse';   
$port     = '3306';
$charset  = 'utf8mb4';
$username = 'root';
$password = '';                

$dsn = "$type:host=$server;dbname=$db;port=$port;charset=$charset";

try {
    $pdo = new PDO($dsn, $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    require 'database-troubleshooting.php';
}