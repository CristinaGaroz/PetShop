<?php
// src/Repository/ProductoRepository.php
/*  namespace App\Repository;

use Doctrine\ORM\EntityRepository;

class ProductoRepository extends EntityRepository
{
    public function listarProductos()
    {
        // Obtener el EntityManager
        $entityManager = $this->getEntityManager();
        
        // Crear una consulta DQL para seleccionar los productos con tipoAnimal = 1
        $query = $entityManager->createQuery(
            'SELECT p FROM App\Entity\Producto p WHERE p.tipoAnimal = :tipoAnimalId'
        )->setParameter('tipoAnimalId', 1);

        // Ejecutar la consulta y devolver los resultados
        return $query->getResult();
    }
    // @ORM\Entity(repositoryClass="App\Repository\ProductoRepository") 
}  */