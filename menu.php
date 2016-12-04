
<link rel="stylesheet" type="text/css" href="stylesheet.css">



<?php /*kommandoen $curpage er for at gøre det tydeligt i menuen hvilken underside man befinder sig på, så den aktive side er synlig*/
	 
	 $curpage = basename ($_SERVER['PHP_SELF']);
	 ?>
	 


<ul id="navigation">
<i><a href="forside.php"<?php if ($curpage == 'forside.php') {echo 'class="active"';}?>>Forside</a></i>
<i><a href="besoeg.php"<?php if ($curpage == 'besoeg.php') {echo 'class="active"';}?>>Besøg</a></i>
<i><a href="om-os.php"<?php if ($curpage == 'om-os.php') {echo 'class="active"';}?>>Om os</a></i>
<i><a href="dyrene.php"<?php if ($curpage == 'dyrene.php') {echo 'class="active"';}?>>Dyrene</a></i>
<i><a href="stoet.php"<?php if ($curpage == 'stoet.php') {echo 'class="active"';}?>>Støt</a></i>
</ul>



