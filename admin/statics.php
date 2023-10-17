<?php 

require "./db.php";
session_start();

if($_SESSION['user']['login']) {} else {
    header('Location: '. 'index.php');
}

$myn = [
    '"город Бугуруслан"',
    'города Бузулука',
    'Гайского городского округа',
    'г. Медногорска',
    'город Новотроицк',
    'г. Оренбурга',
    'г. Орска',
    'Сорочинского городского округа',
    'Абдулинский городской округ Оренбургской  области',
    'Адамовский район',
    'Акбулакский район',
    'Александровского района Оренбургской области"',
    '"Асекеевский район"',
    'Беляевский район',
    'Бугурусланского района',
    'Бузулукского района',
    'Грачевского района',
    'МО Домбаровский район',
    'Илекского района Оренбургской области',
    'Кваркенского района',
    'Красногвардейского района',
    'Кувандыкский городской округ',
    'Курманаевского района',
    'МО "Матвеевский район"',
    'Новоорского района',
    '"Новосергиевский район Оренбургской области"',
    'Октябрьского района',
    'МО Оренбургский район',
    '"Отдел образования администрации Первомайского района Оренбургской области"',
    'Переволоцкого района',
    'Пономаревского района',
    '"Сакмарский район"',
    'Саракташского района Оренбургской области',
    'Светлинский район',
    'Северного района',
    'Соль-Илецкий городской округ Оренбургской области',
    '"Ташлинский район"',
    'Тоцкого района',
    'Тюльганского района',
    '«Шарлыкский район»',
    'МО Ясненский городской округ',
    'МО ЗАТО Комаровский',
];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="css/statics.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <script src="https://www.google.com/jsapi"></script>
    <?php
    $resp; 
    
    if(isset($_POST['mynicipal'])) {
        $mynicipal = $_POST['mynicipal'];
        if(isset($_POST['school']) && isset($_POST['u_class'])) {
            $school = $_POST['school'];
            $class = $_POST['u_class'];
            $query = $pdo->prepare("SELECT `ball`, `class`, `number`, `school`, `mynicipal` FROM `result` WHERE `mynicipal` LIKE '%$mynicipal%'  AND `school` LIKE '%$school%' AND `class` LIKE '%$class%'");
            $query->execute();
            $response = $query->fetchAll();
            $resp = $response;
        } else if(isset($_POST['school'])) {
            $school = $_POST['school'];
            $query = $pdo->prepare("SELECT `ball`, `class`, `number`, `school`, `mynicipal` FROM `result` WHERE `mynicipal` LIKE '%$mynicipal%'  AND `school` LIKE '%$school%'");
            $query->execute();
            $resp = $query->fetchAll();
            $resp = $response;
        } else {
            $school = $_POST['school'];
            $query = $pdo->prepare("SELECT `ball`, `class`, `number`, `school`, `mynicipal` FROM `result` WHERE `mynicipal` LIKE '%$mynicipal%'");
            $query->execute();
            $resp = $query->fetchAll();
            $resp = $response;
        }
    }    
    ?>
</head>
<body>
    <a href="all_test.php" class="btn btn-primary m-2">Назад</a>
    <button class="btn btn-success" id="click">Экcпорт в Excel</button>
    <h2>Статистика</h2>
    <div>
        <form action="" method="POST" class="form-group">
            <select name="mynicipal" id="" class="form-control">
                <option value="">Выберите муниципалитет</option>
                <?php
                for ($i=0; $i < count($myn); $i++) { 
                    $s = str_replace('"', "", $myn[$i]);
                ?>
                    
                <option value='<?=$s?>'><?= $s ?></option>

                <?php } ?>
            </select>
            <select name="school" id="" class="form-control mt-3">
                <option value="">Выберите школу</option>
                <option value="МБОУ Лицей № 1">МБОУ Лицей № 1</option>
            </select>
            <select name="u_class" id="" class="form-control mt-3">
                <option value="">Выберите класс</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="10">10</option>
            </select>
            <button class="btn btn-primary mt-3">Результат</button>
        </form>
        <table class="table" id="simpleTable1">
            <thead>
                <tr>
                    <th>Номер</th>
                    <th>Муниципалитет</th>
                    <th>Школа</th>
                    <th>Класс</th>
                    <th>По списку</th>
                    <th>Балл</th>
                </tr>
            </thead>
            <tbody>
                <?php
                for ($i=0; $i < count($resp); $i++) { 
                    
                
                ?>
                <tr>
                    <td><?= $i+1 ?></td>
                    <td><?= $response[$i]["mynicipal"] ?></td>
                    <td><?= $response[$i]["school"] ?></td>
                    <td><?= $response[$i]["class"] ?></td>
                    <td><?= $response[$i]["number"] ?></td>
                    <td class="balls_<?= $i+1 ?>"><?= $response[$i]["ball"] ?></td>
                </tr>
                <?php
            if($response[$i]["ball"] < 1) {
                $d = $i+1;
                echo "<style>
                .balls_$d {
                    background: lightcoral;
                }
                </style>";
            } else {
                $d = $i+1;
                echo "<style>
                .balls_$d {
                    background: lightgreen;
                }
                </style>";
            }
            
            } ?>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/gh/linways/table-to-excel@v1.0.4/dist/tableToExcel.js"></script>
    <script>
        let btn = document.getElementById("click");

        btn.addEventListener("click", (event) => {
            TableToExcel.convert(document.getElementById("simpleTable1"));
        })

    </script>
</body>
</html>