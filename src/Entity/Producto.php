<?php
// src/Entity/Producto.php
namespace App\Entity;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
*  @ORM\Entity
* @ORM\Table(name="producto")
* 
*/

class Producto{

 /** 
    *  @ORM\Id 
    *  @ORM\Column(type="integer", name="idProducto")
    *  @ORM\GeneratedValue
    */
    private $idProducto;

    /** @ORM\Column(type="string") */
    private $img;

    /** @ORM\Column(type="string") */
    private $nombre;

    /** @ORM\Column(type="string") */
    private $descripcion;

    /** @ORM\Column(type="integer") */
    private $stock;

    /** @ORM\Column(type="decimal", precision=10, scale=2) */
    private $precio;

    /** @ORM\Column(type="string") */
    private $marca;

    /**
    * @ORM\ManyToOne(targetEntity="App\Entity\Categoria")
    * @ORM\JoinColumn(name="categoria", referencedColumnName="idCategoria")
    */
    private $categoria;

    /**
    * @ORM\ManyToOne(targetEntity="App\Entity\TipoAnimal")
    * @ORM\JoinColumn(name="tipoAnimal", referencedColumnName="idTipoAnimal")
    */
    private $tipoAnimal;

      /** @ORM\Column(type="integer", name="productoTop") */
      private $productoTop;

    public function getIdProducto(){
        return $this->idProducto;
    }

    public function getImg(){
        return $this->img;
    }
    public function setImg($img){
        $this->img = $img;
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

    public function getStock(){
        return $this->stock;
    }
    public function setStock($stock){
        $this->stock = $stock;
    }

    public function getPrecio(){
        return $this->precio;
    }
    public function setPrecio($precio){
        $this->precio = $precio;
    }

    public function getMarca(){
        return $this->marca;
    }
    public function setMarca($marca){
        $this->marca = $marca;
    }

    public function getCategoria(){
        return $this->categoria;
    }
    public function setCategoria($categoria){
        $this->categoria = $categoria;
    }

    public function getTipoAnimal(){
        return $this->tipoAnimal;
    }
    public function setTipoAnimal($tipoAnimal){
        $this->tipoAnimal = $tipoAnimal;
    }

    public function getProductoTop(){
        return $this->productoTop;
    }
    public function setProductoTop($productoTop){
        $this->productoTop = $productoTop;
    }
}


