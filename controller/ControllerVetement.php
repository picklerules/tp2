<?php

RequirePage::model('CRUD');
RequirePage::model('Categorie');
RequirePage::model('Vetement');
RequirePage::model('Utilisateur');
RequirePage::model('Vendeur');


class ControllerVetement extends Controller {
    public function index(){
        $vetement = new Vetement;
        $select = $vetement->selectWithVendeur();
        return Twig::render('vetement-index.php', ['vetements'=>$select]);
    }


    public function show($id){
        $vetement = new Vetement;
        $selectId = $vetement->selectId($id);
        $utilisateur = new Utilisateur;
        $selectUserId = $utilisateur->selectId($selectId['ID_Vendeur']);
        return Twig::render('vetement-show.php', ['vetement'=>$selectId, 'nom'=>$selectUserId['Nom']]);
    }

    public function create(){
        $vendeur = new Vendeur;
        $selectVendeurs = $vendeur->selectWithNom();
        return Twig::render('vetement-create.php', ['vendeurs' => $selectVendeurs]);
    }
    
    public function store(){
        $vetement = new Vetement;
        $insert = $vetement->insert($_POST);
        RequirePage::url('vetement/show/' . $insert);
    }
    
    
    public function edit($id){
        $vetement = new Vetement;
        $selectId = $vetement->selectId($id);
        $vendeur = new Vendeur;
        $selectVendeurs = $vendeur->selectWithNom();
        return Twig::render('vetement-edit.php', ['vetement' => $selectId, 'vendeurs' => $selectVendeurs]);
    }
    public function update(){
        $vetement = new Vetement;
        $update = $vetement->update($_POST);
        RequirePage::url('vetement/show/'.$_POST['id']);
    }
    

    public function destroy(){
        $vetement = new Vetement;
        $delete = $vetement->delete($_POST['id']);
        RequirePage::url('vetement/index');
    }

}
?>
