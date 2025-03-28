<?php

// src/Controller/Productos.php
namespace App\Controller;
use App\Entity\Producto;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
/* Con este controlador gestiono la visualizacion de los productos filtrados por tipo de animal y por categoría */
class Productos extends AbstractController{

    /**
     * @Route("/mostrarProductos/{tipoAnimal}/{categoria}", name="mostrarProductos")
     */
    public function mostrarProductos(EntityManagerInterface $entityManager, string $tipoAnimal, string $categoria = null)
    {

        $queryBuilder = $entityManager->createQueryBuilder();
        $queryBuilder->select('p')
            ->from(Producto::class, 'p')
            ->join('p.tipoAnimal', 't')
            ->where('t.nombre = :tipoAnimalNombre')
            ->setParameter('tipoAnimalNombre', $tipoAnimal);

        if ($categoria) {
            $queryBuilder->join('p.categoria', 'c')
                ->andWhere('c.nombre = :categoriaNombre')
                ->setParameter('categoriaNombre', $categoria);
        }

        $productos = $queryBuilder->getQuery()->getResult();

        /* CONTROL DEL STOCK DE LOS PRODUCTOS */
        $productosConStock= [];
        foreach ($productos as $producto) {
            if ($producto->getStock() > 0) {
                $productosConStock[] = $producto;
            }
        }

        // Renderiza la plantilla 'productos.html.twig' con los productos filtrados
        return $this->render('productos.html.twig', [
            'productos' => $productosConStock,
            'tipoAnimal' => $tipoAnimal,
            'categoria' => $categoria,
        ]);
    }
    
    
    /**
     * @Route("/mostrarOtrosAnimales", name="mostrarOtrosAnimales")
     */
    /* Este método 'mostrarOtrosAnimales' muestra todos los productos que no
    sean ni para perros ni para gatos.*/

    public function mostrarOtrosAnimales(EntityManagerInterface $entityManager) {

        $query = $entityManager->createQuery(
            'SELECT p
            FROM App\Entity\Producto p
            JOIN p.tipoAnimal t
            WHERE t.nombre NOT IN (:animalesExcluidos)'
        )->setParameter('animalesExcluidos', ['perros', 'gatos']);
        
        $productos = $query->getResult();

        /* CONTROL DEL STOCK DE LOS PRODUCTOS */
        $productosConStock = [];
        foreach ($productos as $producto) {
            if ($producto->getStock() > 0) {
                $productosConStock[] = $producto;
            }
        }

        // Renderiza la plantilla 'productos.html.twig' con los productos filtrados
        return $this->render('productos.html.twig', [
            'productos' => $productosConStock,
        ]);
    }


    /* PRODUCTO INDIVIDUAL */
    /**
     * @Route("/producto/{id}", name="verProducto")
     */

    /* Este método 'verProducto' muestra la información del producto seleccionado.
    */
    public function verProducto(Producto $producto){

        return $this->render('verProducto.html.twig', [
            'producto' => $producto,
        ]);
    }
}

