<?php
// src/Controller/Carrito.php
namespace App\Controller;
use App\Entity\Producto;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Security\Core\Security;

/* Con este controlador manejo las operaciones que se pueden realizar en mi carrito de compra */
class Carrito extends AbstractController{

    /**
    * @Route("/añadirProducto/{idProducto}", name="añadirProducto")
    */

    /* Con el metodo 'añadirProducto' añado el producto al carrito y si ya existe, 
    incremento en 1 la cantidad del mismo.*/
    public function añadirProducto($idProducto, Request $request, SessionInterface $session, Security $security){
        
        if (!$security->getUser()) {
            return $this->redirectToRoute('login');
        }
        
        $cantidad = $request->get('cantidad', 1);
        $carrito = $session->get('carrito', []);

        if (isset($carrito[$idProducto])) {
            $carrito[$idProducto]['cantidad'] += $cantidad;
        } else {
            $producto = $this->getDoctrine()->getRepository(Producto::class)->find($idProducto);
            if ($producto) {
                $carrito[$idProducto] = [
                    'producto' => $producto,
                    'cantidad' => $cantidad
                ];
            }
        }
        $session->set('carrito', $carrito);

        return $this->redirectToRoute('principal');
    }


    /**
    * @Route("/carrito", name="verCarrito")
    */

    /* Con el método 'verCarrito' muestro todos los productos que están en el carrito
    de la sesión. */

    public function verCarrito(SessionInterface $session,Security $security){

        if (!$security->getUser()) {
            return $this->redirectToRoute('login');
        }

        $carrito = $session->get('carrito', []);
        $total = 0;

        foreach ($carrito as $item) {
            $producto = $item['producto'];
            $cantidad = $item['cantidad'];
            $precio = $producto->getPrecio();
            $total += $precio * $cantidad;
        }

        return $this->render('carrito.html.twig', [
            'carrito' => $carrito,
            'total' => $total,
        ]);
    }

    /**
     * @Route("/eliminarProducto/{idProducto}", name="eliminarProducto")
     */
    
    /* Con este método 'eliminarProducto' verifico si un producto existe en el carrito, si es así,
    lo elimino.*/
    public function eliminarProducto($idProducto, SessionInterface $session,Security $security){
        if (!$security->getUser()) {
            return $this->redirectToRoute('login');
        }
        $carrito = $session->get('carrito', []);
        if (isset($carrito[$idProducto])) {
            unset($carrito[$idProducto]);
            $session->set('carrito', $carrito);
        }
        return $this->redirectToRoute('verCarrito');
    }

    /**
     * @Route("/actualizarCantidad/{idProducto}", name="actualizarCantidad")
     */

    /* Con este método 'ActualizarCantidad', actualizo la cantidad de un producto en
    el carrito. */
    public function actualizarCantidad($idProducto, Request $request, SessionInterface $session,Security $security){
        if (!$security->getUser()) {
            return $this->redirectToRoute('login');
        }
        $carrito = $session->get('carrito', []);
        $cantidad = $request->get('cantidad', 1);

        if (isset($carrito[$idProducto])) {
            $carrito[$idProducto]['cantidad'] = $cantidad;
            $session->set('carrito', $carrito);
        }
        return $this->redirectToRoute('verCarrito');
    }

    /**
     * @Route("/vaciarCarrito", name="vaciarCarrito")
     */
    /* Con el método 'vaciarCarrito' elimino todos los productos del carrito
    inicializando el array como vacío. */
    public function vaciarCarrito(SessionInterface $session){
        $session->set('carrito', []);
        return $this->redirectToRoute('verCarrito');
    }

}






