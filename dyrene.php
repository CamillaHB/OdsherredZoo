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

<h1>Dyrene</h1>

<div id="dyr-wrapper">
<?PHP
require_once 'dbconfig.php';
$sql = 'SELECT id_kategori, kategori, billede FROM kategori';
$stmt = $link->prepare($sql);
$stmt->bind_result($id_kategori, $kategori, $billede);
$stmt->execute();
while($stmt->fetch()){
	echo '<a href="kategori.php?id_kategori='.$id_kategori.'"><img src="'.$billede.'" class="dyr" alt="'.$kategori.'"></a>'.PHP_EOL;
}
?>
</div>
	
<?php include 'footer.php';?>
     
<script>
  var nav = responsiveNav(".nav-collapse");
</script>
</body>
</html>


