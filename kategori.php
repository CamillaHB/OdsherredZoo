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
$id_kategori = filter_input(INPUT_GET, 'id_kategori', FILTER_VALIDATE_INT) or die('missing parameter'); 
$sql = 'SELECT navn, art, billeder.billede, id_dyr
FROM kategori, dyr, billeder
WHERE id_kategori = ?
AND id_kategori = fkey_id_kategori
AND id_dyr = fkey_id_dyr
GROUP BY id_dyr ORDER BY id_dyr DESC;';
$stmt = $link->prepare($sql);
$stmt->bind_param('i', $id_kategori);
$stmt->execute();
$stmt->bind_result($navn, $art, $billede, $id_dyr);
while($stmt->fetch()){
	echo '<li><a href="dyr.php?id_dyr='.$id_dyr.'"><img href="'.$billede.'" alt="'.$navn.'"></a></li>';
}
?>
</ul>	
<?php include 'footer.php';?>
        
</body>
</html>
