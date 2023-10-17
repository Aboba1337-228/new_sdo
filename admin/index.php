<?php

require "./db.php";

session_start();

$message = "";

if(isset($_POST['login']) && isset($_POST['password'])) {
    $login = $_POST['login'];
    $password = $_POST['password'];

    $query = $pdo->prepare("SELECT `id`, `login` FROM `admin` WHERE `login` = ? and `password` = ?");
    $query->execute([$login, $password]);
    $response = $query->fetchAll();

    if($response == NULL) {
        $message = "Неправильный логин или пароль";
    } else {
        $_SESSION['user'] = [
            "login" => $response[0]["login"]
        ];
        header("Location: ". "all_test.php");
    }
}

if($_SESSION['user']['login']) {
    header('Location: '. 'all_test.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auth</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/auth.css">
</head>
<body>
    <form action="" class="form-group" method="POST">
        <h2>Вход в админку</h2>
        <h3><?= $message ?></h3>
        <input class="form-control" name="login" type="text" placeholder="Логин">
        <input class="form-control" name="password" type="password" placeholder="Пароль">
        <button class="btn btn-primary">Войти</button>
    </form>
</body>
</html>