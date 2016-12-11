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
$id_kategori = filter_input(INPUT_GET, 'id_kategori', FILTER_VALIDATE_INT) or die('missing parameter'); 
$sql = 'SELECT navn, art, billeder.billeder, id_dyr
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
$stmt->bind_result($navn, $art, $billede, $id_dyr);
while($stmt->fetch()){
	echo '<a href="dyr.php?id_dyr='.$id_dyr.'"><img class="dyr" src="'.$billede.'" alt="'.$navn.'"></a>';
}
?>	
<?php include 'footer.php';?>
        
</body>
</html>
