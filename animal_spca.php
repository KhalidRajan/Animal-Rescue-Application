<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
</head>

<body>

<h2>Animals</h2>

<table>

<tr><th>Animal ID</th><th>Animal</th><th>Postal_code</th></tr>

<?php
$zipspca = $_POST["zip"];
$dbh = new PDO('mysql:host=localhost;dbname=animal_rescue_app', "root", "");
$rows = $dbh->query("select animal_type, animal_id, zip from animals where zip ='$zipspca' ");
    
    if (is_array($rows) || is_object($rows))
    {
        foreach ($rows as $row)
        {
            echo "<tr><td>".$row[1]."</td><td>".$row[0]."</td><td>".$row[2]."</td></tr>";
            
        }
    }

    $dbh = null;

?>

</table>



 </body>
</html>
