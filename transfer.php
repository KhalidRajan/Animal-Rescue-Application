<!DOCTYPE html>
<html>
<head>
<link href="style.css" type="text/css" rel="stylesheet" >
</head>
<body>


  <?php
  $animal_id = $_POST["Id"];
  $zip = $_POST["zip"];
      $city=$_POST["city"];
      $state=$_POST["state"];


  $dbh = new PDO('mysql:host=localhost;dbname=animal_rescue_app', "root", "");

  $orgdatarows = $dbh->query("select city, state from organizations where zip ='$zip'");
  foreach($orgdatarows as $orgdatarow) {
  	$city=$orgdata[0];
  	$state=$orgdata[1];
  }
  $row = $dbh->query("update animals set city = '$city', state = '$state',zip = '$zip' where animal_id ='$animal_id'");


      $dbh = null;

  ?>

  <h2>This is the updated Table for Animals with the transfer</h2>
  <table>
       <tr><th>Animal ID</th><th>Animal</th><th>Zip</th><th>City</th><th>Province</th></tr>

  <?php
  	$dbh = new PDO('mysql:host=localhost;dbname=animal_rescue_app', "root", "");


  $rows = $dbh->query("select animal_type, animal_id, city, state , zip from animals");


  foreach($rows as $row) {

  echo "<tr><td>".$row[1]."</td><td>".$row[0]."</td><td>".$row[4]."</td><td>".$row[2]."</td><td>".$row[3]."</td></tr>";    }

      $dbh = null;



  ?>
  </table>





   </body>
  </html>
