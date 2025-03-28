<?php
// src/Controller/ConfiguracionController.php
namespace App\Controller;

use App\Entity\Usuario;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\Range;
use Symfony\Component\Validator\Constraints\GreaterThanOrEqual;


    class Configuracion extends AbstractController {

        
        /**
         * @Route("/configuracion", name="configuracion")
         */

        /* Este método 'configuracion' nos redirige al menú de configuración */
        public function configuracion(){

            return $this->render('configuracion/configuracion.html.twig', [

            ]);
        }

        /**
         * @Route("/datosPersonales", name="datosPersonales")
         */
        /* Este método 'datosPersonales' actualiza los datos personales del usuario */
        public function datosPersonales(Request $request, Security $security){

            $errorCorreo = '';
            $entityManager = $this->getDoctrine()->getManager();
            $idUsuario = $security->getUser();
            $usuario = $entityManager->getRepository(Usuario::class)->find($idUsuario);

            $form = $this->createFormBuilder()
                ->add("nombre", TextType::class, ['label' => 'Nombre', 'data' => $usuario ? $usuario->getNombre() : ''])
                ->add("correo", TextType::class, ['label' => 'Correo', 'data' => $usuario ? $usuario->getCorreo() : ''])
                ->add("clave", TextType::class, ['label' => 'Contraseña', 'data' => $usuario ? $usuario->getClave() : ''])
                ->add("telefono", TextType::class, ['label' => 'Telefono', 'data' => $usuario ? $usuario->getTelefono() : '','required' => false,])
                ->add("enviar", SubmitType::class, ['label' => 'Actualizar'])
            ->getForm();
            $form->handleRequest($request);

                if ($form->isSubmitted() && $form->isValid()) {
                    
                    $data = $form->getData();

                    if ($data['correo'] !== $usuario->getCorreo()) {
                        $existeUser = $entityManager->getRepository(Usuario::class)->findOneBy(['correo' => $data['correo']]);

                        if ($existeUser) {
                            $errorCorreo = 'Este correo electrónico ya está en uso.';
                            return $this->render('configuracion/datosPersonales.html.twig', [
                                'form' => $form->createView(), 
                                'errorCorreo' => $errorCorreo,
                            ]);
                        }
                    }

                    $usuario->setNombre($data['nombre']);
                    $usuario->setCorreo($data['correo']);
                    $usuario->setClave($data['clave']);
                    $usuario->setTelefono($data['telefono']);

                    $entityManager->flush();
                    return $this->redirectToRoute('configuracion');
                }
        return $this->render('configuracion/datosPersonales.html.twig', [
            'form' => $form->createView(),
            'errorCorreo' => $errorCorreo,
        ]);

        }

        /**
        * @Route("/cargarSaldo", name="cargarSaldo")
        */
        /* Este método 'cargarSaldo' suma el saldo a cargar al saldo del usuario */

        public function cargarSaldo(Request $request, Security $security){

        $entityManager = $this->getDoctrine()->getManager();
        $idUsuario = $security->getUser();
        $usuario = $entityManager->getRepository(Usuario::class)->find($idUsuario);

        $form3 = $this->createFormBuilder()
        ->add("tarjeta", TextType::class, [
            'label' => 'Nº Tarjeta','constraints' => [
                new Length([
                    'min' => 16,
                    'max' => 16,
                    'exactMessage' => 'El número de tarjeta debe tener 16 dígitos.'
                ]),
                ]
            ])
        ->add("mes", TextType::class, [
            'label' => 'Mes',
            'constraints' => [
                new Range([
                    'min' => 1,
                    'max' => 12,
                    'notInRangeMessage' => 'El mes no es correcto.',
                ]),
            ],
        ])
        ->add("anio", TextType::class, [
            'label' => 'Año',
            'constraints' => [
                new GreaterThanOrEqual([
                    'value' => date('Y'), 
                    'message' => 'El año no puede ser anterior al actual.',
                ]),
            ],
        ])
            ->add("CVV", TextType::class, ['label' => 'CVV'])
            ->add("saldo", TextType::class, ['label' => 'Cantidad (€)'])
            ->add("cargar", SubmitType::class, ['label' => 'Cargar'])
            ->getForm();
        $form3->handleRequest($request);
        
        if ($form3->isSubmitted() && $form3->isValid()) {
            $data = $form3->getData();
            $saldoIngresado = $data['saldo'];
            
            $saldoActual = $usuario->getSaldo();
            $sumarSaldo = $saldoActual + $saldoIngresado;
            $usuario->setSaldo($sumarSaldo);
            
            $entityManager->flush();
            
            return $this->redirectToRoute('configuracion');
        }

            return $this->render('configuracion/cargarSaldo.html.twig', [
                'form3' => $form3->createView(),
            ]);
        }

}