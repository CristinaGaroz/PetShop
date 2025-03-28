<?php
// src/Controller/Confirmacion.php
namespace App\Controller;
use App\Entity\Pedido;
use App\Entity\PedidoProducto;
use App\Entity\Producto;
use App\Entity\Usuario;
use App\Entity\Direccion;
use App\Entity\UsuarioDireccion;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Validator\Constraints\Length;

    class Confirmacion extends AbstractController {

        /* Este método 'calcularTotalCarrito' suma los precios de la lista de productos 
        incluidos en el carrito de la compra */
        private function calcularTotalCarrito(SessionInterface $session)
        {
            $carrito = $session->get('carrito', []);
            $total = 0;
    
            foreach ($carrito as $item) {
                $producto = $item['producto'];
                $cantidad = $item['cantidad'];
                $precio = $producto->getPrecio();
                $total += $precio * $cantidad;
            }
    
            return $total;
        }
    
    /**
     * @Route("/nuevaDireccion", name="nuevaDireccion")
     */

     /* Este método 'nuevaDireccion' añadimos las direcciones de envio de cada usuario */
    public function nuevaDireccion(Request $request, Security $security)
    {
    $usuario = $security->getUser();

    $entityManager = $this->getDoctrine()->getManager();

    $form = $this->createFormBuilder()
        ->add('pais', TextType::class)
        ->add('provincia', TextType::class)
        ->add('ciudad', TextType::class)
        ->add('cp', TextType::class, [
            'label' => 'Codigo postal','constraints' => [
                new Length([
                    'min' => 5,
                    'max' => 5,
                    'exactMessage' => 'El código postal debe tener 5 digitos '
                ]),
                ]
            ])
        ->add('calle', TextType::class)
        ->add('numero', TextType::class)
        ->add('piso', TextType::class, ['required' => false])
        ->add('remitente', TextType::class)
        ->add('guardar', SubmitType::class, [
            'label' => 'Guardar dirección'
        ])
        ->getForm();

    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        $data = $form->getData();

        $direccion = new Direccion();
        $direccion->setPais($data['pais']);
        $direccion->setProvincia($data['provincia']);
        $direccion->setCiudad($data['ciudad']);
        $direccion->setCp($data['cp']);
        $direccion->setCalle($data['calle']);
        $direccion->setNumero($data['numero']);
        $direccion->setPiso($data['piso'] ?? null);
        $direccion->setRemitente($data['remitente']);

        $usuarioDireccion = new UsuarioDireccion();
        $usuarioDireccion->setUsuario($usuario);
        $usuarioDireccion->setDireccion($direccion);

        $entityManager->persist($direccion);
        $entityManager->persist($usuarioDireccion);
        $entityManager->flush();

        return $this->redirectToRoute('resumenPedido');
    }

    return $this->render('nuevaDireccion.html.twig', [
        'form' => $form->createView(),
    ]);
    }


    /**
     * @Route("/seleccionarDireccion", name="seleccionarDireccion", methods={"POST"})
     */
    /* Este método 'seleccionarDireccion' el usuario elige la direccion de envio */
    public function seleccionarDireccion(Request $request, SessionInterface $session): Response
    {
        $direccionId = $request->request->get('idDireccion');
        $entityManager = $this->getDoctrine()->getManager();

        
        $direccion = $entityManager->getRepository(Direccion::class)->find($direccionId);

        if (!$direccion) {
            throw $this->createNotFoundException('La dirección no existe.');
        }

        
        $session->set('direccionSeleccionada', $direccion);

        return $this->redirectToRoute('resumenPedido');
    }

        /**
         * @Route("/eliminarDireccion", name="eliminarDireccion")
         */
        /* Este método 'eliminarDireccion' elimina una de las direcciones de la
        lista de direcciones que tiene el usuario */
        public function eliminarDireccion(Request $request): Response
        {
            $direccionId = $request->request->get('idDireccion');

            if ($direccionId) {
                $entityManager = $this->getDoctrine()->getManager();
                $direccion = $entityManager->getRepository(Direccion::class)->find($direccionId);
                
                if ($direccion) {
                    $entityManager->remove($direccion);
                    $entityManager->flush();

                    return $this->redirectToRoute('resumenPedido');
                }
            }
        }
    

    /**
     * @Route("/resumenPedido", name="resumenPedido")
     */
    /* Este método 'resumenPedido' muestra la información sobre el pedido que va a realizar
    el usuario antes de comprar */
    public function resumenPedido(SessionInterface $session, Security $security): Response
    {
        $usuario = $security->getUser();
        $direccionRepo = $this->getDoctrine()->getRepository(UsuarioDireccion::class);

        $direccionSeleccionada = $session->get('direccionSeleccionada');

        $direcciones = $direccionRepo->findBy(['usuario' => $usuario]);

        $total = $this->calcularTotalCarrito($session);

        return $this->render('resumenPedido.html.twig', [
            'carrito' => $session->get('carrito', []),
            'direccion' => $direccionSeleccionada, 
            'direcciones' => $direcciones,
            'total' => $total,
        ]);
    }


/**
 * @Route("/confirmarPedido", name="confirmarPedido", methods={"POST"})
 */
/* Este método 'confirmarPedido' comprueba que se cumplan todos los requisitos necesarios
para que se realice el pedido. Si es asi, envia un correo electrónico al usuario */
public function confirmarPedido(MailerInterface $mailer, Security $security, SessionInterface $session, EntityManagerInterface $entityManager)
{
    $usuario = $security->getUser();
    $total = $this->calcularTotalCarrito($session);

    /* COMPROBAR SI HAY UNA DIRECCION DE ENVIO ASOCIADA */
    $direccionSeleccionada = $session->get('direccionSeleccionada');
    if (!$direccionSeleccionada) {
        $this->addFlash('error', 'Seleccione una dirección para poder realizar el pedido.');
        return $this->redirectToRoute('resumenPedido');
    }
        /* INSERTAR EN LA TABLA PEDIDO */
        $pedido = new Pedido();
        $pedido->setFecha(new \DateTime());
        $pedido->setPrecioTotal($total);
        $pedido->setUsuario($usuario);
    
        $entityManager->persist($pedido);
        $entityManager->flush();

          /* INSERTAR EN LA TABLA PEDIDOPRODUCTO */
        $carrito = $session->get('carrito');
        foreach ($carrito as $item) {
        $productoId = $item['producto'];
        $cantidad = $item['cantidad'];
        
        // Cargar la entidad Producto usando su ID
        $producto = $entityManager->getRepository(Producto::class)->find($productoId);
        if (!$producto) {
            throw new \Exception('Producto no encontrado');
        }

        if ($producto->getStock() < $cantidad) {
            $this->addFlash('errorstock', sprintf('Stock insuficiente del producto %s, solo quedan %d unidades.', $producto->getNombre(), $producto->getStock())); 
            return $this->redirectToRoute('resumenPedido');
        }

        $producto->setStock($producto->getStock() - $cantidad);

        $pedidoProducto = new PedidoProducto();
        $pedidoProducto->setPedido($pedido);
        $pedidoProducto->setProducto($producto);
        $pedidoProducto->setUnidades($cantidad);

        $entityManager->persist($pedidoProducto);

    /* ACTUALIZAR SALDO DEL USUARIO */
    $usu = $entityManager->getRepository(Usuario::class)->find($usuario);
    $saldoUsuario = $usu->getSaldo();

    if ($saldoUsuario < $total) {

        $this->addFlash('warning', ' No tiene saldo suficiente.');
        return $this->redirectToRoute('cargarSaldo');
        /* throw new \Exception('Saldo insuficiente para realizar el pedido'); */
    }
    }

    $saldoActualizado = $saldoUsuario - $total;
    $usu->setSaldo($saldoActualizado);

        $entityManager->flush();
        $session->set('carrito', []);

    /* ENVIAR CORREO */

    $resumenCarrito="";
    $correo = $usu->getCorreo();
    $direccion = $entityManager->getRepository(Direccion::class)->find($direccionSeleccionada); 

    foreach ($carrito as $item) {
        $producto = $item['producto'];
        $cantidad = $item['cantidad'];
    
        $resumenCarrito .= $producto->getNombre() . "\n" .
            "Cantidad: " . $cantidad . "\n" .
            "Precio unidad: " .$producto->getPrecio()."\n" .
            "Total : " . $producto->getPrecio() * $cantidad . "\n\n";
            
    }

    $emailContent  = "Hola " . $usuario->getUsername() . ",\n\n" .
    "Gracias por tu pedido. Aquí tienes el resumen de tu carrito:\n\n" .
    $resumenCarrito . "\n" .
    "Total pedido:".$total."\n\n".
    "Dirección de entrega:" ."\n" .
    $direccion->getRemitente(). "\n" .
    "Calle ".$direccion->getCalle().", ".$direccion->getNumero().", ".$direccion->getPiso(). "\n" .
    $direccion->getCp()." - ".$direccion->getCiudad();
    ;

    $email = (new Email())
    ->from('dwescristina@gmail.com')
    ->to($correo)
    ->subject('Resumen de tu Pedido')
    ->text($emailContent);

$mailer->send($email);  

    return $this->redirectToRoute('verPedidos');
}
    }
    
