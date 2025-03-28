<?php
// src/Controller/Principal.php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\Producto;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;

/* Con este controlador muestro en la página principal de la web los productos
top, los productos recomendados para perros y los productos recomendados para gatos, y los
obtengo a través de una consulta DQL */

class Principal extends AbstractController{

    /**
     * @Route("/principal", name="principal")
     */
    public function principal(EntityManagerInterface $entityManager): Response {
    
        
        /* PRODUCTOS TOP */
        $queryBuilder = $entityManager->createQueryBuilder();

        $queryProductoTop = $queryBuilder
            ->select('pt')
            ->from(Producto::class, 'pt')
            ->where('pt.productoTop = 1')
            ->andWhere('pt.stock > 0') 
            ->getQuery();

        $productoTop = $queryProductoTop->getResult();

        /* RECOMENDADO PERRO */
        $queryRecomendadoPerro = $entityManager->createQueryBuilder()
            ->select('rp')
            ->from(Producto::class, 'rp')
            ->where('rp.productoTop = 2')
            ->andWhere('rp.stock > 0')
            ->getQuery();

        $recomendadoPerro = $queryRecomendadoPerro->getResult();
        
         /* RECOMENDADO GATO */
        $queryRecomendadoGato = $entityManager->createQueryBuilder()
            ->select('rg')
            ->from(Producto::class, 'rg')
            ->where('rg.productoTop = 3')
            ->andWhere('rg.stock > 0') 
            ->getQuery();

        $recomendadoGato = $queryRecomendadoGato->getResult();

        
        return $this->render('principal.html.twig', [
            'productoTop' => $productoTop,
            'recomendadoPerro' => $recomendadoPerro,
            'recomendadoGato' =>$recomendadoGato
        ]);
    }

}
