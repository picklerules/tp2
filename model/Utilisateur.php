<?php
require_once('CRUD.php');

class Utilisateur extends CRUD {
    protected $table = 'Utilisateurs';
    protected $primaryKey = 'id';
    protected $fillable = ['nom', 'email', 'motdepasse'];


}
