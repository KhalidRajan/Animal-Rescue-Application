<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
</head>

<body>
<img src="images/panda.png" alt="">
<h1>Animal Rescue Application</h1>
<h2>Completed By Khalid Rajan, Noah Gutmann and Ramtin Kalkhoran</h2>

<p>Please follow the prompts below to find out information regarding animals, drivers, shelters, SPCAs and adopters in our domain</p>

<h2>These are the SPCA locations</h2>

<table>
     <tr><th>SPCA Locations</th><th> Postal Codes</th></tr>

<?php

$dbh = new PDO('mysql:host=localhost;dbname=animal_rescue_app', "root", "");


$rows = $dbh->query("select name, zip from organizations o, SPCA s where o.organization_id=s.organization_id");
foreach($rows as $row) {

		echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td></tr>";
    }

    $dbh = null;

?>

</table>

<h2>Enter the postal code of an SPCA location to find information about the animals situated there</h2>

<form action="animal_spca.php" method="post">
<p>Postal Code:</p>
<input type="text" name="zip">
<br>
<input type="submit">
</form>

<h2>These are the organizations to which donations have been made</h2>
<table>
<tr><th>Organization Name</th><th>Organization ID</th></tr>

<?php
$dbh = new PDO('mysql:host=localhost;dbname=animal_rescue_app', "root", "");
$rows=$dbh->query("select o.organization_id, o.name from organizations o INNER JOIN donation d on o.organization_id=d.organization_id;");
foreach ($rows as $row) {
  echo "<tr><td>".$row[1]."</td><td>".$row[0]."</td></tr>";
  // code...
}
$dbh=null;


 ?>

 </table>

 <h2>Enter an ID from the table above to see how much was donated to that organization in 2018</h2>

<form action="donations.php" method="post">
<p>ID:</p>
<input type="text" name="organization_id">
<br>
<input type="submit">
</form>

<h2>These are all of the Animals in the database presently</h2>
<table>
     <tr><th>Animal ID</th><th>Animal</th><th>City</th><th>State</th><th>Zip</th></tr>
<?php
    $dbh = new PDO('mysql:host=localhost;dbname=animal_rescue_app', "root", "");


$rows = $dbh->query("select animal_type, animal_id, zip from animals");


foreach($rows as $row) {
        
echo "<tr><td>".$row[1]."</td><td>".$row[0]."</td><td>".$row[2]."</td></tr>";
    
    
    
}

    $dbh = null;
    
    

?>

</table>




<h2>Enter an Animal Id and its destination Postal Code to transfer the animal to that location</h2>

<form action="transfer.php" method="post">
<p>Anmal ID:</p>
<input type="text" name="Id">
<br>
<p>Destination Postal Code:</p>
<input type="text" name="zip"><br>
<p>City:</p>
<input type="text" name="city">
<br>
<p>State:</p>
<input type="text" name="state">
<input type="submit">
</form>


<h2>These are all of the Rescue Location Reference Numbers in the Database Currently</h2>


<table>
     <tr><th>Rescue Reference Number</th></tr>
<?php
    $dbh = new PDO('mysql:host=localhost;dbname=animal_rescue_app', "root", "");


$rows = $dbh->query("select rescueReferenceNum from rescue");


foreach($rows as $row) {
        
echo "<tr><td>".$row[0]."</td></tr>";
    
    
    
}

    $dbh = null;
    
    

?>

</table>




<h2>Enter one of the Rescue Refernce Numbers from the above table to find information about the drivers associated with that particular Rescue Organization</h2>

<form action="rescue.php" method="post">
<p>RescueReferenceNum:</p>
<input type="text" name="rescueReferenceNum">
<br>
<input type="submit">
</form>






</body>




</html>
