<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<title>Dyrene</title>
</head>    
<body> 
<?PHP
include 'menu.php';
?>
<h1>Dyrene</h1>
<ul>
<?PHP
require_once 'dbconfig.php';
$sql = 'SELECT id_kategori, kategori, billede FROM kategori';
$stmt = $link->prepare($sql);
$stmt->bind_result($id_kategori, $kategori, $billede);
$stmt->execute();
while($stmt->fetch()){
	echo '<li><a href="kategori.php?id_kategori='.$id_kategori.'"><img href="'.$billede.'" alt="'.$kategori.'"></a></li>'.PHP_EOL;
}
?>
</ul>

<?php include 'footer.php';?>
        
</body>
</html>
