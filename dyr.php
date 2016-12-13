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

<?PHP
require_once 'dbconfig.php';
$id_dyr = filter_input(INPUT_GET, 'id_dyr', FILTER_VALIDATE_INT) or die('missing parameter'); 
$sql = 'SELECT navn, art, billeder.billeder, information, region, kategori, kategori.billede, id_kategori, id_oprindelse
FROM kategori, dyr, billeder, dyr_has_oprindelse, oprindelse
WHERE id_dyr = ?
AND id_dyr = billeder.fkey_id_dyr
AND id_dyr = dyr_has_oprindelse.fkey_id_dyr
AND fkey_id_oprindelse = id_oprindelse
AND id_kategori = fkey_id_kategori
GROUP BY id_dyr ORDER BY id_dyr DESC;';
$stmt = $link->prepare($sql);
$stmt->bind_param('i', $id_dyr);
$stmt->execute();
$stmt->bind_result($navn, $art, $billede, $info, $region, $kategori, $kbil, $id_kat, $id_oprindelse);
while($stmt->fetch()){
	echo '<h1>'.$navn.'</h1><img class="dyr" src="'.$billede.'" alt="'.$navn.'"><p>'.$info.'</p><p>'.$region.'</p>';
    echo '<p>andre<a href="kategori.php?id_kategori='.$id_kat.'"><img class="dyr" src="'.$kbil.'" alt='.$kategori.'></a><p>andre dyr fra</p><a href="steder.php?id_oprindelse='.$id_oprindelse.'">'.$region.'</a>';
}
?>	

<?php include 'footer.php';?>

<script>
  var nav = responsiveNav(".nav-collapse");
</script>
</body>
</html>
