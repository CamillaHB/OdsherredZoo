<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/stylesheet.css">
<title>Odsherred Zoo</title>

<style>
body {
	background-image: url(images/bg-front.jpg) !important;
}
</style>
</head>

<body>
<!-- navigations bar -->
<div id="nav">
<img src="images/logo.png" id="logo" alt="odsherred zoo logo med abe" />
<img src="images/lupe_white.png" id="lupe" alt="white search icon" />
<input type="search" placeholder="søg" id="search" />
<br>
<!-- dropdown menu -->
<div id="navMenu">
<ul><li><a href="forside.php" class="active">Forside</a></li></ul>
<ul><li><a href="besoeg.php">Besøg</a>
	<ul>
	<li><a href="#">Parken</a></li>
	<li><a href="#">Priser</a></li>
	<li><a href="#">Rejseplan</a></li>
	</ul> 
</li> </ul> 
<ul><li><a href="om-os.php">Om os</a>
	<ul>
	<li><a href="#">Historien</a></li>
	<li><a href="#">Rescue zoo</a></li>
	</ul>
</li></ul> 
<ul><li><a href="dyrene.php">Dyrene</a></li></ul>
<ul><li><a href="stoet.php">Støt</a></li></ul>
</div>
<!--enden af dropdown menu-->
</div>
<!--enden af nav-->

<!-- indhold på siden -->
<img src="images/front-text.gif" id="front-text" alt="forside tekst">
	
<?php include 'footer.php';?>
        

</body>
</html>


