<?php
// src/Entity/TipoAnimal.php
namespace App\Entity;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity
* @ORM\Table(name="tipoAnimal")

*/

class TipoAnimal{

/** 
    *  @ORM\Id 
    *  @ORM\Column(type="integer" , name="idTipoAnimal")
    *  @ORM\GeneratedValue
    */
    private $idTipoAnimal;

    /** @ORM\Column(type="string") */
    private $nombre;

    /** @ORM\Column(type="string") */
    private $descripcion;



    public function getIdTipoAnimal(){
        return $this->idTipoAnimal;
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