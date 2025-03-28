<?php
// src/Entity/Categoria.php
namespace App\Entity;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity
* @ORM\Table(name="categoria")
*/

class Categoria{

/** 
    *  @ORM\Id 
    *  @ORM\Column(type="integer",name="idCategoria")
    *  @ORM\GeneratedValue
    */
    private $idCategoria;

    /** @ORM\Column(type="string") */
    private $nombre;

    /** @ORM\Column(type="string") */
    private $descripcion;
    
    public function getIdCategoria(){
        return $this->idCategoria;
    }

    public function getNombre(){
        return $this->nombre;
    }
    public function setNombre($nombre){
        $this->nombre = $nombre;
    }

    public function getDescripcion(){
        return $this->descripcion;
    }
    public function setDescripcion($descripcion){
        $this->descripcion = $descripcion;
    }
}