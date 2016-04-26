<?php

class Categories{
	static function getAllCategories(){
		global $bdd;
	        
	    $req = $bdd->prepare('SELECT * FROM categories');
	    $req->execute();
	    $categories = $req->fetchAll();
	    
	    return $categories;
}
}

?>