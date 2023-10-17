<?php 

require "./db.php";

function Statics() {
    global $pdo;

    $query = $pdo->prepare("SELECT * FROM `result` WHERE 1");
    $query->execute();
    return $query->fetchAll();
}

$response = Statics();

for ($i=0; $i < count($response); $i++) { 
    $ball = $response[$i]['ball'];
    $mynicipal = $response[$i]['mynicipal'];
    $school = $response[$i]['school'];
    $class = $response[$i]['class'];
    $number = $response[$i]['number'];
}

echo count($response);
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
</head>
<body>
    <form action="" class="form-group">
        <select name="" id="" class="form-control">
            <option value="">Выберите муниципалитет</option>
        </select>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
</body>
</html>