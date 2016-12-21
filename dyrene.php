<!doctype html>
<html>
<?    
<head>
<meta charset="UTF-8">
<meta name="description" content="Odsherred Zoo Rescue er danmarks eneste rescue zoo. Læs og lær om de forskellige dyr vi har i parken. Vi har bl.a. mange forskellige aber, fugle, reptiler, slanger og edderkopper!">
<script src="js/responsive-nav.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/fade.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/stylesheet.css">
<title>Odsherred Zoo | Dyrene</title>
</head>

<body>

<?php include 'header.php'; ?>

<h1>Dyrene</h1>

<?PHP
require_once 'dbconfig.php';
$sql = 'SELECT id_kategori, kategori, billede FROM kategori';
$stmt = $link->prepare($sql);
$stmt->bind_result($id_kategori, $kategori, $billede);
$stmt->execute();
while($stmt->fetch()){
	echo '<div class="dwrap"><a href="kategori.php?id_kategori='.$id_kategori.'"><div class="dyrshadow"><p>'.$kategori.'</p></div><img src="'.$billede.'" class="dyr picture" alt="'.$kategori.'"></a></div>'.PHP_EOL;
}
?>    

<?php include 'footer.php'; ?>
     
<script>
  var nav = responsiveNav(".nav-collapse");
</script>
</body>
</html>


