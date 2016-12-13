<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/stylesheet.css">
<script src="js/responsive-nav.js" type="text/javascript"></script>
<title>Odsherred Zoo | Dyrene</title>
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
$id_kategori = filter_input(INPUT_GET, 'id_kategori', FILTER_VALIDATE_INT) or die('missing parameter'); 
$sql = 'SELECT navn, art, billeder.billeder, id_dyr, kategori
FROM kategori, dyr, billeder
WHERE id_kategori = ?
AND id_kategori = fkey_id_kategori 
AND fkey_id_kategori = fkey_kategori_id_kategori
AND fkey_kategori_id_kategori = id_kategori
AND id_dyr = fkey_id_dyr
GROUP BY id_dyr ORDER BY id_dyr';
$stmt = $link->prepare($sql);
$stmt->bind_param('i', $id_kategori);
$stmt->execute();
$stmt->bind_result($navn, $art, $billede, $id_dyr, $kategori);
$check=0;
while($stmt->fetch()){
    if ($check==0) {
    echo  '<h1>'.$kategori.'</h1>';
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
