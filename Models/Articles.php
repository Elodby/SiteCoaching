<?php
class Article{
	function getArticle($id){
		global $bdd;
	        
	    $req = $bdd->prepare('SELECT * FROM article WHERE ID_ARTICLE = :id');
	    $req->bindParam(':id', $id, PDO::PARAM_INT);
	    $req->execute();
	    $article = $req->fetchAll();
	    
	    return $article;
	}

	function getArticlesByCategory($category_id){
		global $bdd;
	        
	    $req = $bdd->prepare('SELECT * FROM article WHERE ID_CATEGORIE = :category_id');
	    $req->bindParam(':category_id', $ID_CATEGORIE, PDO::PARAM_INT);
	    $req->execute();
	    $articles = $req->fetchAll();
	    
	    return $articles;
	}
}

?>