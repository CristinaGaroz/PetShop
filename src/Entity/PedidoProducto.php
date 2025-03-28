<?php
// src/Entity/PedidoProducto.php
namespace App\Entity;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity
* @ORM\Table(name="pedidoproducto")
*/

class PedidoProducto{

/** 
    *  @ORM\Id 
    *  @ORM\Column(type="integer")
    *  @ORM\GeneratedValue
    */
    private $idPedidoProducto;


    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Pedido")
     * @ORM\JoinColumn(name="pedido", referencedColumnName="idPedido")
     */
    private $pedido;

    /**
    * @ORM\ManyToOne(targetEntity="App\Entity\Producto")
    * @ORM\JoinColumn(name="producto", referencedColumnName="idProducto")
    */
    private $producto;

    /** @ORM\Column(type="integer") */
    private $unidades;

    public function getIdPedidoProducto(){
        return $this->idPedidoProducto;
    }

    public function getPedido(){
        return $this->pedido;
    }
    public function setPedido($pedido){
        $this->pedido = $pedido;
    }

    public function getProducto(){
        return $this->producto;
    }
    public function setProducto($producto){
        $this->producto = $producto;
    }

    public function getUnidades(){
        return $this->unidades;
    }
    public function setUnidades($unidades){
        $this->unidades = $unidades;
    }

}