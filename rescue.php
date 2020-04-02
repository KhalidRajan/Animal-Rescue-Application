<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
</head>

<body>

<h2>Drivers</h2>

<table>

<tr><th>Name</th><th>License Plate</th><th>License Number</th></tr>

<?php
$rescueReferenceNum = $_POST["rescueReferenceNum"];
$dbh = new PDO('mysql:host=localhost;dbname=animal_rescue_app', "root", "");
$rows = $dbh->query("select name, license_plate, license_number from drivers where rescueReferenceNum ='$rescueReferenceNum' ");

    if (is_array($rows) || is_object($rows))
    {
        foreach ($rows as $row)
        {
            echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td></tr>";

        }
    }

    $dbh = null;

?>

</table>



 </body>
</html>
