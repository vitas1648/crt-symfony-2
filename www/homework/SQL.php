<!doctype html>
<html>
<head>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<?php

    include 'header.php';
    $link = mysqli_connect('mysql', 'root', 'secret', 'homework');
    if ($link) {
        echo "<table>";
        echo "<tr><th>Страна</th><th>Город</th><th>Год основания</th></tr>";
        $sql = "SELECT countries.name AS country, cities.name AS city, cities.founded_at AS founded_at  FROM countries, cities WHERE countries.id = cities.country_id";
        $result = mysqli_query($link, $sql);

        while ($row = mysqli_fetch_array($result)) {
            printf("<tr><td>%s</td><td>%s</td><td>%s</td></tr>", $row["country"], $row["city"], (int)substr($row["founded_at"], 0, 4));
        }
        echo "</table>";
        echo "<table>";
        echo "<tr><th>Класс животного</th><th>Животное</th><th>Летает</th><th>Кол-во ног</th></tr>";
        $sql = "SELECt animal_classes.name AS animal_class, animals.name AS animal, animals.can_flying AS can_flying, animals.legs_count AS legs_count FROM animal_classes, animals WHERE animal_classes.id = animals.class_id";
        $result = mysqli_query($link, $sql);

        while ($row = mysqli_fetch_array($result)) {
            printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n", $row["animal_class"], $row["animal"], $row["can_flying"] ? "Летает" : "Не летает", $row["legs_count"]);
        }

        echo "</table>";
    }

?>
</body>
</html>
