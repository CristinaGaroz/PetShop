<?php
// src/Controller/Buscador.php
namespace App\Controller;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

/* Con este controlador manejo la lógica del buscador de mi web para obtener el producto
y filtra por nombre y marca del producto a través de una consulta DQL.*/

    class Buscador extends AbstractController{
    /**
     * @Route("/buscarProductos", name="buscarProductos")
     */
    public function buscarProductos(Request $request){

        $palabraBuscada = $request->get('busqueda');

        $entityManager = $this->getDoctrine()->getManager();
        $query = $entityManager->createQuery(
            "SELECT p
            FROM App\Entity\Producto p
            WHERE p.nombre LIKE :query
            OR p.marca LIKE :query"
        )->setParameter('query', '%'.$palabraBuscada.'%');
        
        $productosBuscador = $query->getResult();

        return $this->render('buscador.html.twig', [
            'productosBuscador' => $productosBuscador,
            'busqueda' => $palabraBuscada,
        ]);
    }
}
