<?php 
require "./config.php";
require "./db.php";
session_start();

if(isset($_POST['items']) && isset($_POST['class']) && isset($_POST['answer'])) {
    $_items = $_POST['items'];
    $_class = $_POST['class'];
    $_answer = $_POST['answer'];

    $random = rand(1,999999999999999999);
    $filename = $_FILES["file_test"]["name"];
    $full = "$random-$filename";
    $tempname = $_FILES["file_test"]["tmp_name"];
    $folder = "./image/" . $full;
    move_uploaded_file($tempname, $folder);

    $test = $pdo->prepare("INSERT INTO `quest`(`item`, `class`, `quest`, `answer`) VALUES (?,?,?,?)");
    $test->execute([$_items, $_class, $full, $_answer]);
    echo "<script>alert('Вопрос добавлен'); location.href='all_test.php'</script>";
}

if($_SESSION['user']['login']) {} else {
    header('Location: '. 'index.php');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/add_test.css">
</head>
<body>
    <a href="all_test.php" class="btn btn-primary m-3">Назад</a>
    <form action="" method="POST" enctype="multipart/form-data">
        <h2>Добавление теста</h2>
        <label for="">Картинка:</label>
        <input type="file" name="file_test" required>
        <label for="">Предмет:</label>
        <select class="form-control" name="items" id="" required>
            <?php
            foreach ($items as $key => $value) {            
            ?>
                <option value="<?= $value ?>"><?= $key ?></option>
            <?php
            }
            ?>
        </select>
        <label for="">Класс:</label>
        <select class="form-control" name="class" id="" required>
            <?php
            foreach ($class as $key) {            
            ?>
                <option value="<?= $key ?>"><?= $key ?></option>
            <?php
            }
            ?>
        </select>
        <label for="">Правильный ответ:</label>
        <input type="text" name="answer" class="form-control" placeholder="Введите правильный ответ к вопросу" required>
        <button class="btn btn-primary">Добавить</button>
    </form>
</body>
</html>