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
        
</body>
</html>
