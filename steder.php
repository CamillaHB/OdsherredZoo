<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/stylesheet.css">
<script src="js/responsive-nav.js" type="text/javascript"></script>
<title>Dyrene</title>
</head>
    
<body>
<!-- navigations bar -->
<div id="nav">
<img src="images/logo.png" id="logo" alt="odsherred zoo logo med abe" />
<img src="images/lupe_white.png" id="lupe" alt="white search icon" />
<input type="search" placeholder="søg" id="search" />
<br>
<!-- burger menu -->
<nav class="nav-collapse">
<ul>
<li><a href="forside.php">Forside</a></li>
<li><a href="parken.php">Parken</a></li> 
<li><a href="om-os.php">Om os</a></li>
<li class="active"><a href="dyrene.php">Dyrene</a></li>
<li><a href="stoet.php">Støt</a></li>
<li><a href="praktisk.php">Praktisk</a></li>
</ul>
</nav>
<!--enden af burger menu-->
</div>
<!--enden af nav-->

<ul>
<?PHP
require_once 'dbconfig.php';
$id_oprindelse = filter_input(INPUT_GET, 'id_oprindelse', FILTER_VALIDATE_INT) or die('Noget gik galt!'); 
$sql = 'SELECT navn, billeder.billeder, id_dyr, region
FROM dyr, billeder, dyr_has_oprindelse, oprindelse
WHERE id_oprindelse = ?
AND id_dyr = billeder.fkey_id_dyr
AND id_dyr = dyr_has_oprindelse.fkey_id_dyr
AND id_oprindelse = fkey_id_oprindelse
GROUP BY id_dyr ORDER BY id_dyr DESC;';
$stmt = $link->prepare($sql);
$stmt->bind_param('i', $id_oprindelse);
$stmt->execute();
$stmt->bind_result($navn, $billede, $id_dyr, $region);
$check=0;
while($stmt->fetch()){

if ($check==0) {
    echo  '<h1>dyr fra '.$region.'</h1>';
    $check++;
}
	echo '<a href="dyr.php?id_dyr='.$id_dyr.'"><img class="dyr" src="'.$billede.'" alt="'.$navn.'"></a>';
}
?>	
</ul>	
<?php include 'footer.php';?>
        
<script>
  var nav = responsiveNav(".nav-collapse");
</script>
</body>
</html>
