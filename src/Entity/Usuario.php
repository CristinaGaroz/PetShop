<?php
// src/Entity/Usuario.php
namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;


/**
* @ORM\Entity
* @ORM\Table(name="usuario")
*/

class Usuario implements UserInterface, \Serializable{
    /** 
    *  @ORM\Id
    *  @ORM\Column(type="integer", name="idUsuario")
    *  @ORM\GeneratedValue
    */
    private $idUsuario;

    /** @ORM\Column(type="string", name="nombre") */
    private $nombre;

     /** @ORM\Column(type="string" , unique=true) */
    private $correo;

    /** @ORM\Column(type="integer", name="telefono") */
    private $telefono;

    /** @ORM\Column(type="decimal", precision=10, scale=2 ,name="saldo") */
    private $saldo;

    /** @ORM\Column(type="string", name="clave") */
    private $clave;


    /** @ORM\Column(type="json", name="rol") */
    private $rol=[];

    

    public function getIdUsuario(){
        return $this->idUsuario;
    }

    public function getNombre(){
        return $this->nombre;
    }
    public function setNombre($nombre){
        $this->nombre = $nombre;
    }


    public function getCorreo(){
        return $this->correo;
    }
    public function setCorreo($correo){
        $this->correo = $correo;
    }

    public function getTelefono(){
        return $this->telefono;
    }
    public function setTelefono($telefono){
        $this->telefono = $telefono;
    }

    public function getSaldo(){
        return $this->saldo;
    }
    public function setSaldo($saldo){
        $this->saldo = $saldo;
    }

    public function getClave(){
        return $this->clave;
    }
    public function setClave($clave){
        $this->clave = $clave;
    }

     public function setRol($rol){
        $this->rol = $rol;
    }
 
    public function serialize(){
    return serialize(array(
        $this->idUsuario,
        $this->nombre,
        $this->clave,
        $this->correo,
    ));
    }

    public function unserialize($serialized){
        list(
            $this->idUsuario,
            $this->nombre,
            $this->clave,
            $this->correo,
            ) = unserialize($serialized);
    }
    
     public function getRoles(){
        return $this->rol;
    } 

    public function getPassword(){
        return $this->getClave();
    }

    public function getSalt(){
        return;
    }

    public function getUsername(){
        return $this->getNombre();
    }

    public function eraseCredentials(){
        return;
    }
}


