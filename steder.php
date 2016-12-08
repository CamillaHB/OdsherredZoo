<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<title>Dyrene</title>
</head>
    
<?PHP include 'menu.php'; ?>
<ul>
<?PHP
require_once 'dbconfig.php';
$id_oprindelse = filter_input(INPUT_GET, 'id_oprindelse', FILTER_VALIDATE_INT) or die('Noget gik galt!'); 
$sql = 'SELECT navn, billeder.billede, id_dyr, region
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
while($stmt->fetch()){
	echo '<h1>dyr fra '.$region.'</h1><li><a href="dyr.php?id_dyr='.$id_dyr.'"><img href="'.$billede.'" alt="'.$navn.'"></a></li>';
}
?>
</ul>	
<?php include 'footer.php';?>
        
</body>
</html>
