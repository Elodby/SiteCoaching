<?php 
	try {
$bdd = new PDO('mysql:host=localhost;dbname=sitecoaching', 'root', '');
	} 
	catch(Exception $e) {
		die("Erreur:".$e->getMessage());
	}
?>