<?php 

$dsn = "mysql:host=localhost;dbname=sdo2;charset=UTF8";
$user = "root";
$password = "";

$pdo = new PDO($dsn, $user, $password);
if(!$pdo) {
    die("connect db error");
}

?>