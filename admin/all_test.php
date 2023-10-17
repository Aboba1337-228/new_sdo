<?php

require "./config.php";
require "./db.php";
session_start();

if($_SESSION['user']['login']) {} else {
    header('Location: '. 'index.php');
}

function allQuest() {
    global $pdo;

    $quest = $pdo->prepare("SELECT * FROM `quest` WHERE 1");
    $quest->execute();
    $items = $quest->fetchAll();
    return $items;
}

$resp = allQuest();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
</head>
<body>
    <a href="add_test.php" class="btn btn-success m-3">Добавить</a>
    <a href="statics.php" class="btn btn-primary m-3">Статистика</a>
    <a href="add_test.php" class="float-right btn btn-danger m-3">Выйти</a>
    <table class="table">
        <thead>
            <tr>
                <th>Номер</th>
                <th>Предмет</th>
                <th>Класс</th>
                <th>Правильный ответ</th>
                <th>Вопрос(картинка)</th>
                <th>Кнопка</th>
            </tr>
        </thead>

        <tbody>
            <?php

            if(isset($_POST['delete'])) {
                global $pdo;
                $id = $_POST['delete'];

                $query = $pdo->prepare("DELETE FROM `quest` WHERE `id` = ?");
                $query->execute([$id]);
                echo "<script>alert('Удаленно'); location.href='all_test.php'</script>";
            }
            
            for ($i=0; $i < count($resp); $i++){
            
            ?>
            <tr>
                <td><?= $resp[$i]['id'] ?></td>
                <td><?= $resp[$i]['item'] ?></td>
                <td><?= $resp[$i]['class'] ?></td>
                <td><?= $resp[$i]['answer'] ?></td>
                <td><img src="image/<?= $resp[$i]['quest'] ?>" width="70" height="70" alt=""></td>
                <td>
                    <form action="" method="POST">
                        <input name="delete" type="text" style="position: absolute; top:-10000px" value="<?= $resp[$i]['id'] ?>">
                        <button class="btn btn-danger">Удалить</button>
                    </form>
                </td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
</body>
</html>