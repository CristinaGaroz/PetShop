<?php
// src/Entity/Direccion.php
namespace App\Entity;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Mapping as ORM;


/**
* @ORM\Entity
* @ORM\Table(name="direccion")
*/

class Direccion{
    /** 
        *  @ORM\Id 
        *  @ORM\Column(type="integer",name="idDireccion")
        *  @ORM\GeneratedValue
        */
        private $idDireccion;

        /** @ORM\Column(type="string") */
        private $pais;

        /** @ORM\Column(type="string") */
        private $provincia;

        /** @ORM\Column(type="string") */
        private $ciudad;

        /** @ORM\Column(type="integer") */
        private $cp;

        /** @ORM\Column(type="string") */
        private $calle;

        /** @ORM\Column(type="integer") */
        private $numero;

        /** @ORM\Column(type="string") */
        private $piso;

        /** @ORM\Column(type="string") */
        private $remitente;

        


        public function getId(){
            return $this->idDireccion;
        }

        public function getPais(){
            return $this->pais;
        }
        public function setPais($pais){
            $this->pais = $pais;
        }

        public function getProvincia(){
            return $this->provincia;
        }
        public function setProvincia($provincia){
            $this->provincia = $provincia;
        }

        public function getCiudad(){
            return $this->ciudad;
        }
        public function setCiudad($Ciudad){
            $this->ciudad = $Ciudad;
        }

        public function getCp(){
            return $this->cp;
        }
        public function setCp($cp){
            $this->cp = $cp;
        }

        public function getCalle(){
            return $this->calle;
        }
        public function setCalle($calle){
            $this->calle = $calle;
        }

        public function getNumero(){
            return $this->numero;
        }
        public function setNumero($numero){
            $this->numero = $numero;
        }

        public function getPiso(){
            return $this->piso;
        }
        public function setPiso($piso){
            $this->piso = $piso;
        }

        public function getRemitente(){
            return $this->remitente;
        }
        public function setRemitente($remitente){
            $this->remitente = $remitente;
        }



}