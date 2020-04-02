<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
</head>



<body>



<table>




<?php
$organization_id= $_POST["organization_id"];
$dbh = new PDO('mysql:host=localhost;dbname=animal_rescue_app', "root", "");


$name = $dbh->query("select name from organizations where organization_id ='$organization_id'");

    if (is_array($name) || is_object($name)){
        foreach($name as $n){
            echo "<h2>Total Amount donated to '$n[0]' in 2018:</h2>";
        }
        
    }

$rows = $dbh->query("select sum(amount) from donation where organization_id ='$organization_id' and donation_date >= convert('20180101',date) and donation_date <= CONVERT('20181231',date)");
echo "<tr><th> Amount</th></tr>";
    
    
    
    
    if(is_array($rows)||is_object($rows)){
        foreach($rows as $row) {
            echo "<tr><td>$row[0]</td><tr>";
        }
        
    }


    $dbh = null;


?>

</table>


</body>

</html>
