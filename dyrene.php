<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/stylesheet.css">
<title>Odsherred Zoo | Dyrene</title>
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
<ul><li><a href="forside.php">Forside</a></li></ul>
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
<ul><li><a href="dyrene.php" class="active">Dyrene</a></li></ul>
<ul><li><a href="stoet.php">Støt</a></li></ul>
</div>
<!--enden af dropdown menu-->
</div>
<!--enden af nav-->

<h1>Dyrene</h1>

<div id="dyr-wrapper">
<img src="images/edderkopper.png" class="dyr" alt="fugleedderkop">
<img src="images/fugle.png" class="dyr" alt="røde araer">
<img src="images/gnavere.png" class="dyr" alt="præriehund">
<img src="images/hovdyr.png" class="dyr" alt="lamaer">
<img src="images/leddyr.png" class="dyr" alt="tusindeben">
<img src="images/padder.png" class="dyr" alt="træfrø">
<img src="images/primater.png" class="dyr" alt="dødningehovedabe">
<img src="images/rovdyr.png" class="dyr" alt="europæisk los">
<img src="images/skildpadder.png" class="dyr" alt="skildpadde">
<img src="images/slanger.png" class="dyr" alt="slange">
</div>
	
<?php include 'footer.php';?>
        
</body>
</html>


