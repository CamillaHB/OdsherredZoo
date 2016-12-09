<?PHP
// constants for database connection
//Test
const DB_HOST = 'localhost';
const DB_USER = 'root';
const DB_PASS = '';
const DB_NAME = 'eksamen';

$link = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
if ($link->connect_error) {
	die("Connection Failed: " . $link->connect_error);
}
$link->set_charset('utf8');
?>
