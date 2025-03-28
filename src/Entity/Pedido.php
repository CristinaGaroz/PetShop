<?php
// src/Entity/Pedido.php
namespace App\Entity;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Mapping as ORM;


/**
* @ORM\Entity
* @ORM\Table(name="pedido")
*/

class Pedido{
    /** 
    *  @ORM\Id 
    *  @ORM\Column(type="integer", name="idPedido")
    *  @ORM\GeneratedValue
    */
    private $idPedido;

    /**@ORM\Column(type="date", name="fecha")*/
    private $fecha;
    
    /** @ORM\Column(type="decimal", precision=10, scale=2) */
    private $precioTotal;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Usuario")
     * @ORM\JoinColumn(name="usuario", referencedColumnName="idUsuario")
     */
    private $usuario;

    public function getIdPedido(){
        return $this->idPedido;
    }

    public function getFecha(){
        return $this->fecha;
    }
    public function setFecha($fecha){
        $this->fecha = $fecha;
    }

    public function getPrecioTotal(){
        return $this->precioTotal;
    }
    public function setPrecioTotal($precioTotal){
        $this->precioTotal = $precioTotal;
    }

    public function getUsuario(){
        return $this->usuario;
    }
    public function setUsuario($usuario){
        $this->usuario = $usuario;
    }

}