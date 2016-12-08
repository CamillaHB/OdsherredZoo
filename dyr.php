<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<title>Dyrene</title>
</head>
    
<?PHP include 'menu.php'; ?>
<?PHP
require_once 'dbconfig.php';
$id_dyr = filter_input(INPUT_GET, 'id_dyr', FILTER_VALIDATE_INT) or die('missing parameter'); 
$sql = 'SELECT navn, art, billeder.billede, information, region
FROM kategori, dyr, billeder, dyr_has_oprindelse, oprindelse
WHERE id_dyr = ?
AND id_dyr = billeder.fkey_id_dyr
AND id_dyr = dyr_has_oprindelse.fkey_id_dyr
AND fkey_id_oprindelse = id_oprindelse
GROUP BY id_dyr ORDER BY id_dyr DESC;';
$stmt = $link->prepare($sql);
$stmt->bind_param('i', $id_dyr);
$stmt->execute();
$stmt->bind_result($navn, $art, $billede, $info, $region);
while($stmt->fetch()){
	echo '<p>'.$navn.'</p><img href="'.$billede.'" alt="'.$navn.'"><p>'.$info.'</p><p>'.$region.'</p>';
}
?>	
<?php include 'footer.php';?>
        
</body>
</html>
