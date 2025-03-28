<?php
// src/Entity/UsuarioDireccion.php
namespace App\Entity;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity
* @ORM\Table(name="usuariodireccion")
*/

class UsuarioDireccion{
/** 
    *  @ORM\Id 
    *  @ORM\Column(type="integer" , name="idUserDir")
    *  @ORM\GeneratedValue
    */
    private $idUserDir;

    /**
    * @ORM\ManyToOne(targetEntity="App\Entity\Usuario")
    * @ORM\JoinColumn(name="usuario", referencedColumnName="idUsuario")
    */
    private $usuario;

    /**
    * @ORM\ManyToOne(targetEntity="App\Entity\Direccion")
    * @ORM\JoinColumn(name="direccion", referencedColumnName="idDireccion")
    */
    private $direccion;

    public function getIdUserDir(){
        return $this->idUserDir;
    }

    public function getUsuario(){
        return $this->usuario;
    }
    public function setUsuario($usuario){
        $this->usuario = $usuario;
    }

    public function getDireccion(){
        return $this->direccion;
    }
    public function setDireccion($direccion){
        $this->direccion = $direccion;
    }



}