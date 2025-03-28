<?php

// src/Controller/MisPedidos.php
namespace App\Controller;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

/* Con este controlador muestro los detalles de los pedidos realizados por el usuario autenticado */
    
    class MisPedidos extends AbstractController{
    /**
     * @Route("/verPedidos", name="verPedidos", methods={"GET"})
     */

    public function verPedidos(EntityManagerInterface $entityManager, Security $security){
        
        $usuario = $security->getUser();

        $query = $entityManager->createQuery('
            SELECT 
                p.idPedido,
                pr.nombre AS nombre_producto,
                pp.unidades,
                (pp.unidades * pr.precio) AS total_producto
            FROM 
                App\Entity\PedidoProducto pp
            JOIN 
                App\Entity\Pedido p WITH pp.pedido = p.idPedido
            JOIN 
                App\Entity\Producto pr WITH pp.producto = pr.idProducto
            WHERE
                p.usuario = :usuario
        ');
        $query->setParameter('usuario', $usuario);

        $detallesPedidos = $query->getResult();

        return $this->render('misPedidos.html.twig', [
            'detallesPedidos' => $detallesPedidos,
        ]);
    }
    }