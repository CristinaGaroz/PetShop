<?php

// src/Controller/Registro.php

namespace App\Controller;
use App\Entity\Usuario;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;



class Registro extends AbstractController{

    /**
    * @Route("/registro", name="registro")
    */
    /* Este método 'registro' guarda en la base de datos los nuevos usuarios */

    public function registro(Request $request){
        $errorCorreo = null;
        $errorContraseña = null;
        $existeCorreo= null;
    $form = $this->createFormBuilder()
        ->add("nombre", TextType::class, array('label' => 'Nombre'))
        ->add("correo", TextType::class, array('label' => 'Correo'))
        ->add("clave", PasswordType::class, array('label' => 'Contraseña'))
        ->add("confirmarClave", PasswordType::class, array('label' => 'Confirmar Contraseña'))
        ->add("enviar", SubmitType::class, array('label' => 'Registrarse'))
        ->getForm();

    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        $data = $form->getData();
        $nombre = $data['nombre'];
        $correo = $data['correo'];
        $clave = $data['clave'];
        $confirmarClave = $data['confirmarClave'];
        
        if (!filter_var($correo, FILTER_VALIDATE_EMAIL)) {
            $errorCorreo = 'El correo electrónico no es válido.';
        } elseif (!preg_match('/@.*\.(com|es)$/i', $correo)) {
            $errorCorreo = 'El correo electrónico debe terminar en .com o .es.';
        }

        if ($clave!== $confirmarClave) {
            $errorContraseña = 'Las contraseñas no coinciden.';
        }

        
        if ($errorCorreo || $errorContraseña) {
            return $this->render('registro.html.twig', array(
                'form' => $form->createView(),
                'errorContraseña' => $errorContraseña,
                'errorCorreo' =>$errorCorreo,
                'existeCorreo' => $existeCorreo
            ));
        }

        $entityManager = $this->getDoctrine()->getManager();
        $usuarioExistente = $entityManager->getRepository(Usuario::class)->findOneBy(['correo' => $correo]);

        if ($usuarioExistente) {
            $existeCorreo= 'Ya existe una cuenta con ese correo electrónico.';
            
            return $this->render('registro.html.twig', array(
                'form' => $form->createView(),
                'errorContraseña' => $errorContraseña,
                'errorCorreo' =>$errorCorreo,
                'existeCorreo' => $existeCorreo
            ));
        }
        
        $entityManager = $this->getDoctrine()->getManager();
        $nuevo = new Usuario();

        $nuevo->setNombre($nombre);
        $nuevo->setCorreo($correo);
        $nuevo->setClave($clave);
        $nuevo->setRol(["ROLE_ADMIN"]);
        $nuevo->setSaldo(0.0);
        $entityManager->persist($nuevo);
        $entityManager->flush(); 

        $this->addFlash('success', '¡Se ha registrado con éxito!. Para realizar su pedido, inicie sesión.');
        return $this->redirectToRoute("login");

    }

    return $this->render('registro.html.twig', array(
        'form' => $form->createView(),
        'errorContraseña' => $errorContraseña,
        'errorCorreo' =>$errorCorreo,
        'existeCorreo' => $existeCorreo
        
    ));
}
}